using Google.Apis.Auth.OAuth2;
using Google.Apis.Drive.v2;
using Google.Apis.Drive.v2.Data;
using Google.Apis.Services;
using Google.Apis.Util.Store;
using System;
using System.Collections.Generic;
using System.Linq;
using System.IO;
using System.Threading;
using System.Web;

namespace XemphimOnline.Areas.Admin.Model
{
    public class GoogleDriveFileRepository
    {
        public static string[] Scopes = { Google.Apis.Drive.v3.DriveService.Scope.Drive };
        public static Google.Apis.Drive.v3.DriveService GetService_v3()
        {
            UserCredential credential;
            using (var stream = new FileStream(@"D:\GitRepo\OnlineMovie-master\credentials.json", FileMode.Open, FileAccess.Read))
            {
                String FolderPath = @"D:\GitRepo\OnlineMovie-master\";
                String FilePath = Path.Combine(FolderPath, "DriveServiceCredentials.json");

                credential = GoogleWebAuthorizationBroker.AuthorizeAsync(
                    GoogleClientSecrets.Load(stream).Secrets,
                    Scopes,
                    "user",
                    CancellationToken.None,
                    new FileDataStore(FilePath, true)).Result;
            }

            //Create Drive API service.
            Google.Apis.Drive.v3.DriveService service = new Google.Apis.Drive.v3.DriveService(new BaseClientService.Initializer()
            {
                HttpClientInitializer = credential,
                ApplicationName = "GoogleDriveRestAPI-v3",
            });

            return service;
        }
        public static Google.Apis.Drive.v2.DriveService GetService_v2()
        {
            UserCredential credential;
            using (var stream = new FileStream(@"D:\GitRepo\OnlineMovie-master\credentials.json", FileMode.Open, FileAccess.Read))
            {
                String FolderPath = @"D:\GitRepo\OnlineMovie-master\";
                String FilePath = Path.Combine(FolderPath, "DriveServiceCredentials.json");

                credential = GoogleWebAuthorizationBroker.AuthorizeAsync(
                    GoogleClientSecrets.Load(stream).Secrets,
                    Scopes,
                    "user",
                    CancellationToken.None,
                    new FileDataStore(FilePath, true)).Result;
            }

            //Create Drive API service.
            Google.Apis.Drive.v2.DriveService service = new Google.Apis.Drive.v2.DriveService(new BaseClientService.Initializer()
            {
                HttpClientInitializer = credential,
                ApplicationName = "GoogleDriveRestAPI-v2",
            });

            return service;
        }
        public static void CreateFolder(string FolderName, ref string folderId, string parent)
        {
            Google.Apis.Drive.v3.DriveService service = GetService_v3();

            Google.Apis.Drive.v3.Data.File FileMetaData = new Google.Apis.Drive.v3.Data.File();
            FileMetaData.Name = FolderName;
            FileMetaData.MimeType = "application/vnd.google-apps.folder";
            //idfolder of shared folder in gg drive
            FileMetaData.Parents = new List<string> { parent };

            Google.Apis.Drive.v3.FilesResource.CreateRequest request;

            request = service.Files.Create(FileMetaData);
            request.Fields = "id";
            request.SupportsTeamDrives = true;
            var file = request.Execute();
            //Console.WriteLine("Folder ID: " + file.Id);
            folderId = file.Id;
        }
        public static void FileUploadInFolder(string folderId, HttpPostedFileBase[] files, ref string videoID)
        {
            foreach (HttpPostedFileBase file in files)
            {
                if (file != null && file.ContentLength > 0)
                {
                    Google.Apis.Drive.v3.DriveService service = GetService_v3();

                    string path = Path.Combine(HttpContext.Current.Server.MapPath("~/Areas/GoogleDriveFiles"),
                    Path.GetFileName(file.FileName));
                    file.SaveAs(path);

                    var FileMetaData = new Google.Apis.Drive.v3.Data.File()
                    {
                        Name = Path.GetFileName(file.FileName),
                        MimeType = MimeMapping.GetMimeMapping(path),
                        Parents = new List<string>
                    {
                        folderId
                    }
                    };

                    Google.Apis.Drive.v3.FilesResource.CreateMediaUpload request;
                    using (var stream = new System.IO.FileStream(path, System.IO.FileMode.Open))
                    {
                        request = service.Files.Create(FileMetaData, stream, FileMetaData.MimeType);
                        request.Fields = "id";
                        request.SupportsTeamDrives = true;
                        request.Upload();
                    }
                    var file1 = request.ResponseBody;
                    videoID = file1.Id;
                }
            }
        }
    }
}