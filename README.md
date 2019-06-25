# Purposefully Insecure and Vulnerable Android Application
Created by [High-Tech Bridge](https://www.htbridge.com), the Purposefully Insecure and Vulnerable Android Application (PIVAA) replaces outdated DIVA for benchmark of mobile vulnerability scanners. You can use [free online mobile app scanner](https://www.htbridge.com/mobile) to run the test and compare with other apps.

## How to build

Easiest way is to import the project into Android Studio.

 * Clone the repo: ```git clone github.com/HTbridge/pivaa```
 * Open the project in Android Studio
 * Build -> Make Project

## How to run

You can import it in Android Studio or directly use the build available in ´apks/´ folder.

You can install it as any other Android applications.

 * Build or download the application
 * Allow installation of unknown sources on your emulator or phone
 * If it is a real phone, enable USB debugging
 * Connect it and run ```adb install pivaa.apk```


## Vulnerabilities covered
  
#### Usage of weak Initialization Vector
When Cipher Block Chaining (CBC) or Cipher Feedback (CFB) modes are used in encryption, the Initialization Vector must be unpredictable and random.
  

#### Possible Man-In-The-Middle Attack
Improper or missing hostname verification exposes mobile application users to MITM attacks under certain conditions.
  

#### Remote URL load in WebView
Loading a remote URL can be a dangerous practice in WebView. Verify the interactions made with WebView and ensure the trustworthiness, integrity and reliability of third-party URLs used in the mobile application.
  

#### Object deserialization found
Object deserialization performed on an untrusted resource (e.g. user-supplied input or external storage), can be dangerous if the data for deserialization is tampered by an attacker.
  

#### User-supplied input in SQL queries
Inclusion of user-supplied input into SQL queries can potentially lead to a local SQL injection vulnerability in the mobile application. The correct approach is to use prepared SQL statements beyond user's control.
  

#### Missing tapjacking protection
By default, Android allows applications to draw over some portions of the phone screen and permits touch events to be sent to mobile applications in the lower 'layer'. This can be used by an attacker to trick application users into performing some sensitive actions in a legitimate application (e.g. send a payment) they do not otherwise intend doing.
  

#### Enabled Application Backup
The mobile application uses external backup functionality (default Android backup mechanism) that may store inside sensitive data from the application. In certain conditions, this may lead to information disclosure (e.g. when a backup server or your  Gmail account is compromised).
  

#### Enabled Debug Mode
The mobile application has debug mode enabled. Debug mode is used by application developers during development process and should be disabled when application is in production. This mode can expose technical information and can facilitate reverse engineering of the application.
  

#### Weak encryption
Weak or badly implemented encryption algorithms can endanger data storage and transmission used by the mobile application.
  

#### Hardcoded encryption keys
Hardcoded encryption keys can jeopardize secure data storage and transmission within the mobile application under certain circumstances.
  

#### Dynamic load of code
The mobile application uses dynamic load of executable code. Under certain circumstances, dynamic load of code can be dangerous. For example, if the code is located on an external storage (e.g. SD card), this can lead to code injection vulnerability if the external storage is world readable and/or writable and an attacker can access it.
  

#### Creation of world readable or writable files
The mobile application creates files with world readable or writable permissions. Such  files can be accessed and modified by other applications, including malicious ones, thus imperiling the application's data integrity.
  

#### Usage of unencrypted HTTP protocol
The mobile application uses HTTP protocol to send or receive data. The design of HTTP protocol does not provide any encryption of the transmitted data, which can be easily intercepted if an attacker is located in the same network or has access to data channel of the victim.
  

#### Weak hashing algorithms
The mobile application uses weak hashing algorithms. Weak hashing algorithms (e.g. MD2, MD4, MD5 or SHA-1) can be vulnerable to collisions and other security weaknesses, and should not be used when reliable hashing of data is required.
  

#### Predictable Random Number Generator
The mobile application uses predictable Random Number Generator. Under certain conditions this can jeopardize the entire data encryption performed by the mobile application.
  

#### Exported Content Providers with insufficient protection 
The mobile application contains exported content providers. Content providers are used to share data between different applications. Other applications, including malicious ones, can access exported content providers.  This can lead to various security issues, including information disclosure. To securely export your content provider, you can set-up 'android:protectionLevel' or 'android:grantUriPermissions' attributes in Android Manifest file in order to restrict access to your content providers.
  

#### Exported Broadcast Receivers
The mobile application contains an exported receiver enabling other applications, including malicious ones, to send intents without restrictions. By default, Broadcast Receivers is exported in Android, as the result any application will be able to send an intent to the Broadcast Receiver of the application. To define which applications can send intents to mobile application's Broadcast Receiver set relevant permissions in the Android Manifest file.
  
  
#### Exported Services
The mobile application contains an exported service. By default, in Android services are not exported and cannot be invoked by other applications. However, if an intent filter is defined in  Android Manifest file, it is exported by default. Particular attention should be given to the exported services, as without the specific permissions, they can be used by any other applications including malicious ones.
  

#### JS enabled in a WebView
The mobile application has enabled JavaScript in WebView. By default, JavaScript is disabled in WebView, if enabled it can bring various JS-related security issues, such as Cross-Site Scripting (XSS) attacks.
  

#### Deprecated setPluginState in WebView
The mobile application uses a deprecated setPluginState method in WebView. The 'setPluginState' method was deprecated in Android's API level 18 because plugins will not be supported anymore in the future and should not be used. Example of plugins are embedded PDF reader, Flash plugin, etc.
  

#### Temporary file creation
The mobile application creates temporary files. Despite that cache files are usually private by default, it is recommended to make sure that temporary files are securely deleted when they are not required by the application anymore.
  

#### Hardcoded data
The mobile application contains debugging or potentially sensitive hardcoded data. An attacker with an access to the mobile application file can easily extract this data from the application and use it in any further attacks if it contains any internal or confidential information.
  
#### Untrusted CA acceptance
The mobile application may allow some untrusted Certificate Authorities (CA) to be used. TrustManager allows developers to accept certificates not trusted by Android. This feature can tremendously facilitate MiTM attacks.
  

#### Usage of banned API functions
The mobile application uses some of the banned API functions. API functions are usually banned for compelling security and privacy reasons and shall not be used.
  

#### Self-signed CA enabled in WebView
The mobile application's WebView accepts self-signed and otherwise untrusted certificates. This may create a risk of Man-in-the-Middle (MITM) attacks under many circumstances.
  

#### Path Traversal
The mobile application may be vulnerable to path traversal vulnerability. The mobile application uses NSTemporaryDirectory() method that can be misused if not implemented properly.
  
  
#### Cleartext SQLite database
The mobile application uses an unencrypted SQLite database. This database can be accessed by an attacker with physical access to the mobile device or a malicious application with root access to the device. The application should not store sensitive information in clear text.

## Contributing

If you want to give us your feedback or you have ideas of vulnerabilites we could implement. Please write us an email to mobile [at] htbridge [dot] com.

## License

PIVAA is released under GNU General Public License v3.0.
