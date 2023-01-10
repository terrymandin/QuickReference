# git clone https://github.com/Azure/azure-iot-sdk-csharp.git
# dotnet add package System.Diagnostics.PerformanceCounter --version 7.0.0
# cd .\azure-iot-sdk-csharp\provisioning\device\samples\how to guides\SymmetricKeySample
  
using System.Diagnostics;

Console.WriteLine("Sending 1,000 telemetry messages 5 seconds apart ...");
PerformanceCounter cpuCounter;
PerformanceCounter ramCounter;
cpuCounter = new PerformanceCounter("Processor", "% Processor Time", "_Total");
ramCounter = new PerformanceCounter("Memory", "Available MBytes");
for (int i = 0; i<100; i++)
{
    var jsonMessage = new
    {
        Computer = System.Environment.MachineName,
        TimeStamp = DateTime.Now,
        CPU = cpuCounter.NextValue()+"%",
        Memory = ramCounter.NextValue()+"MB"
    };
    Console.WriteLine("SENDING - " + jsonMessage.ToString());
    using var message = new Message(Encoding.UTF8.GetBytes(jsonMessage.ToString()));
    await iotClient.SendEventAsync(message);
    System.Threading.Thread.Sleep(5000);
}
