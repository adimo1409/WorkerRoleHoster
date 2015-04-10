<?xml version="1.0" encoding="utf-8"?>
<serviceModel xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" name="AzureCloudService5" generation="1" functional="0" release="0" Id="58f71e5a-9d30-41f7-84f5-f4af43d1a916" dslVersion="1.2.0.0" xmlns="http://schemas.microsoft.com/dsltools/RDSM">
  <groups>
    <group name="AzureCloudService5Group" generation="1" functional="0" release="0">
      <componentports>
        <inPort name="WebHost:Endpoint1" protocol="http">
          <inToChannel>
            <lBChannelMoniker name="/AzureCloudService5/AzureCloudService5Group/LB:WebHost:Endpoint1" />
          </inToChannel>
        </inPort>
      </componentports>
      <settings>
        <aCS name="WebHostInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/AzureCloudService5/AzureCloudService5Group/MapWebHostInstances" />
          </maps>
        </aCS>
        <aCS name="WorkerHostInstances" defaultValue="[1,1,1]">
          <maps>
            <mapMoniker name="/AzureCloudService5/AzureCloudService5Group/MapWorkerHostInstances" />
          </maps>
        </aCS>
      </settings>
      <channels>
        <lBChannel name="LB:WebHost:Endpoint1">
          <toPorts>
            <inPortMoniker name="/AzureCloudService5/AzureCloudService5Group/WebHost/Endpoint1" />
          </toPorts>
        </lBChannel>
        <sFSwitchChannel name="SW:WorkerHost:CalculatorService">
          <toPorts>
            <inPortMoniker name="/AzureCloudService5/AzureCloudService5Group/WorkerHost/CalculatorService" />
          </toPorts>
        </sFSwitchChannel>
      </channels>
      <maps>
        <map name="MapWebHostInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/AzureCloudService5/AzureCloudService5Group/WebHostInstances" />
          </setting>
        </map>
        <map name="MapWorkerHostInstances" kind="Identity">
          <setting>
            <sCSPolicyIDMoniker name="/AzureCloudService5/AzureCloudService5Group/WorkerHostInstances" />
          </setting>
        </map>
      </maps>
      <components>
        <groupHascomponents>
          <role name="WebHost" generation="1" functional="0" release="0" software="C:\Users\cdadoua\Documents\Visual Studio 2012\Projects\AzureCloudService5\AzureCloudService5\csx\Release\roles\WebHost" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaIISHost.exe " memIndex="-1" hostingEnvironment="frontendadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="Endpoint1" protocol="http" portRanges="80" />
              <outPort name="WorkerHost:CalculatorService" protocol="tcp">
                <outToChannel>
                  <sFSwitchChannelMoniker name="/AzureCloudService5/AzureCloudService5Group/SW:WorkerHost:CalculatorService" />
                </outToChannel>
              </outPort>
            </componentports>
            <settings>
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;WebHost&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;WebHost&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;r name=&quot;WorkerHost&quot;&gt;&lt;e name=&quot;CalculatorService&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/AzureCloudService5/AzureCloudService5Group/WebHostInstances" />
            <sCSPolicyUpdateDomainMoniker name="/AzureCloudService5/AzureCloudService5Group/WebHostUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/AzureCloudService5/AzureCloudService5Group/WebHostFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
        <groupHascomponents>
          <role name="WorkerHost" generation="1" functional="0" release="0" software="C:\Users\cdadoua\Documents\Visual Studio 2012\Projects\AzureCloudService5\AzureCloudService5\csx\Release\roles\WorkerHost" entryPoint="base\x64\WaHostBootstrapper.exe" parameters="base\x64\WaWorkerHost.exe " memIndex="-1" hostingEnvironment="consoleroleadmin" hostingEnvironmentVersion="2">
            <componentports>
              <inPort name="CalculatorService" protocol="tcp" />
              <outPort name="WorkerHost:CalculatorService" protocol="tcp">
                <outToChannel>
                  <sFSwitchChannelMoniker name="/AzureCloudService5/AzureCloudService5Group/SW:WorkerHost:CalculatorService" />
                </outToChannel>
              </outPort>
            </componentports>
            <settings>
              <aCS name="__ModelData" defaultValue="&lt;m role=&quot;WorkerHost&quot; xmlns=&quot;urn:azure:m:v1&quot;&gt;&lt;r name=&quot;WebHost&quot;&gt;&lt;e name=&quot;Endpoint1&quot; /&gt;&lt;/r&gt;&lt;r name=&quot;WorkerHost&quot;&gt;&lt;e name=&quot;CalculatorService&quot; /&gt;&lt;/r&gt;&lt;/m&gt;" />
            </settings>
            <resourcereferences>
              <resourceReference name="DiagnosticStore" defaultAmount="[4096,4096,4096]" defaultSticky="true" kind="Directory" />
              <resourceReference name="EventStore" defaultAmount="[1000,1000,1000]" defaultSticky="false" kind="LogStore" />
            </resourcereferences>
          </role>
          <sCSPolicy>
            <sCSPolicyIDMoniker name="/AzureCloudService5/AzureCloudService5Group/WorkerHostInstances" />
            <sCSPolicyUpdateDomainMoniker name="/AzureCloudService5/AzureCloudService5Group/WorkerHostUpgradeDomains" />
            <sCSPolicyFaultDomainMoniker name="/AzureCloudService5/AzureCloudService5Group/WorkerHostFaultDomains" />
          </sCSPolicy>
        </groupHascomponents>
      </components>
      <sCSPolicy>
        <sCSPolicyUpdateDomain name="WebHostUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyUpdateDomain name="WorkerHostUpgradeDomains" defaultPolicy="[5,5,5]" />
        <sCSPolicyFaultDomain name="WebHostFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyFaultDomain name="WorkerHostFaultDomains" defaultPolicy="[2,2,2]" />
        <sCSPolicyID name="WebHostInstances" defaultPolicy="[1,1,1]" />
        <sCSPolicyID name="WorkerHostInstances" defaultPolicy="[1,1,1]" />
      </sCSPolicy>
    </group>
  </groups>
  <implements>
    <implementation Id="03512e8d-77d9-4100-a7a7-77e159612c04" ref="Microsoft.RedDog.Contract\ServiceContract\AzureCloudService5Contract@ServiceDefinition">
      <interfacereferences>
        <interfaceReference Id="5557161d-e263-4945-89b1-c2e9920837e0" ref="Microsoft.RedDog.Contract\Interface\WebHost:Endpoint1@ServiceDefinition">
          <inPort>
            <inPortMoniker name="/AzureCloudService5/AzureCloudService5Group/WebHost:Endpoint1" />
          </inPort>
        </interfaceReference>
      </interfacereferences>
    </implementation>
  </implements>
</serviceModel>