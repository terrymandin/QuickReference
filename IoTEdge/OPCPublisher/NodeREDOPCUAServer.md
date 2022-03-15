# Node-RED OPC UA Server
Below is a Node-Red OPC UA server that displays CPU and Memory
```
[
    {
        "id": "553d44862958b541",
        "type": "tab",
        "label": "My Flow",
        "disabled": false,
        "info": "",
        "env": []
    },
    {
        "id": "9789c32cab339973",
        "type": "cpu",
        "z": "553d44862958b541",
        "name": "",
        "msgCore": false,
        "msgOverall": true,
        "msgArray": false,
        "msgTemp": false,
        "x": 490,
        "y": 160,
        "wires": [
            [
                "d8737c0f3f1bb468"
            ]
        ]
    },
    {
        "id": "55860d6bb6575022",
        "type": "interval",
        "z": "553d44862958b541",
        "name": "interval",
        "interval": "1",
        "onstart": false,
        "msg": "ping",
        "showstatus": true,
        "unit": "seconds",
        "statusformat": "YYYY-MM-D HH:mm:ss",
        "x": 320,
        "y": 300,
        "wires": [
            [
                "9789c32cab339973",
                "26d27123b42ffee5"
            ]
        ]
    },
    {
        "id": "26d27123b42ffee5",
        "type": "memory",
        "z": "553d44862958b541",
        "name": "",
        "relativeValues": false,
        "unitType": "mb",
        "totalMemory": false,
        "usedMemory": true,
        "freeMemory": false,
        "availableMemory": false,
        "activeMemory": false,
        "buffersMemory": false,
        "cachedMemory": false,
        "slabMemory": false,
        "buffcacheMemory": false,
        "freeAvailableMemory": false,
        "swapTotalMemory": false,
        "swapUsedMemory": false,
        "swapFreeMemory": false,
        "x": 480,
        "y": 360,
        "wires": [
            [
                "8e5280b12ee17978"
            ]
        ]
    },
    {
        "id": "86ed05baf0809afa",
        "type": "debug",
        "z": "553d44862958b541",
        "name": "CPU Variable Debug",
        "active": true,
        "tosidebar": true,
        "console": false,
        "tostatus": false,
        "complete": "payload",
        "targetType": "msg",
        "statusVal": "",
        "statusType": "auto",
        "x": 1020,
        "y": 160,
        "wires": []
    },
    {
        "id": "71968a1ff0599c0c",
        "type": "OpcUa-Server",
        "z": "553d44862958b541",
        "port": "53881",
        "name": "",
        "endpoint": "",
        "users": "",
        "nodesetDir": "",
        "autoAcceptUnknownCertificate": true,
        "registerToDiscovery": false,
        "constructDefaultAddressSpace": true,
        "allowAnonymous": true,
        "endpointNone": true,
        "endpointSign": false,
        "endpointSignEncrypt": false,
        "endpointBasic128Rsa15": false,
        "endpointBasic256": false,
        "endpointBasic256Sha256": false,
        "maxNodesPerBrowse": 0,
        "maxNodesPerHistoryReadData": 0,
        "maxNodesPerHistoryReadEvents": 0,
        "maxNodesPerHistoryUpdateData": 0,
        "maxNodesPerRead": 0,
        "maxNodesPerWrite": 0,
        "maxNodesPerMethodCall": 0,
        "maxNodesPerRegisterNodes": 0,
        "maxNodesPerNodeManagement": 0,
        "maxMonitoredItemsPerCall": 0,
        "maxNodesPerHistoryUpdateEvents": 0,
        "maxNodesPerTranslateBrowsePathsToNodeIds": 0,
        "x": 1000,
        "y": 260,
        "wires": [
            [
                "75e39b1028af940b"
            ]
        ]
    },
    {
        "id": "d7229ca4d1267dbb",
        "type": "inject",
        "z": "553d44862958b541",
        "name": "Add OPC Memory Variable",
        "props": [
            {
                "p": "payload"
            },
            {
                "p": "topic",
                "vt": "str"
            }
        ],
        "repeat": "",
        "crontab": "",
        "once": true,
        "onceDelay": "10",
        "topic": "ns=1;s=Memory;datatype=Double",
        "payload": "{\"opcuaCommand\":\"addVariable\"}",
        "payloadType": "json",
        "x": 720,
        "y": 260,
        "wires": [
            [
                "71968a1ff0599c0c"
            ]
        ]
    },
    {
        "id": "1faad2aa92dfaf93",
        "type": "inject",
        "z": "553d44862958b541",
        "name": "Set Memory Variable One Time",
        "props": [
            {
                "p": "payload"
            },
            {
                "p": "topic",
                "vt": "str"
            }
        ],
        "repeat": "",
        "crontab": "",
        "once": false,
        "onceDelay": 0.1,
        "topic": "",
        "payload": "{\"messageType\":\"Variable\",\"namespace\":\"1\",\"variableName\":\"Memory\",\"variableValue\":123}",
        "payloadType": "json",
        "x": 730,
        "y": 300,
        "wires": [
            [
                "71968a1ff0599c0c"
            ]
        ]
    },
    {
        "id": "8e5280b12ee17978",
        "type": "function",
        "z": "553d44862958b541",
        "name": "Set Memory OPC Variable",
        "func": "var returnMsg = \n    { payload : \n        { \n            \"messageType\": \"Variable\",\n            \"namespace\": \"1\",\n            \"variableName\": \"Memory\",\n            \"variableValue\": msg.payload\n        }\n    }; \nreturn returnMsg;   ",
        "outputs": 1,
        "noerr": 0,
        "initialize": "// Code added here will be run once\n// whenever the node is started.\n\n/*async function delay(timeMs) {\n  await new Promise(resolve => setTimeout(resolve, timeMs));\n}\n\nvar createVarMsg =\n    {\n        payload :\n            {\n                \"opcuaCommand\": \"addVariable\"\n            },\n        topic : \"ns=1;s=VariableName;datatype=Double\"\n    };\nawait delay(20000);\nreturn createVarMsg;\n*/",
        "finalize": "",
        "libs": [],
        "x": 720,
        "y": 360,
        "wires": [
            [
                "71968a1ff0599c0c",
                "98db820227ef7288"
            ]
        ]
    },
    {
        "id": "98db820227ef7288",
        "type": "debug",
        "z": "553d44862958b541",
        "name": "Memory Variable Debug",
        "active": true,
        "tosidebar": true,
        "console": false,
        "tostatus": false,
        "complete": "payload",
        "targetType": "msg",
        "statusVal": "",
        "statusType": "auto",
        "x": 1030,
        "y": 360,
        "wires": []
    },
    {
        "id": "75e39b1028af940b",
        "type": "debug",
        "z": "553d44862958b541",
        "name": "OPC Output",
        "active": true,
        "tosidebar": true,
        "console": false,
        "tostatus": false,
        "complete": "payload",
        "targetType": "msg",
        "statusVal": "",
        "statusType": "auto",
        "x": 1250,
        "y": 260,
        "wires": []
    },
    {
        "id": "2f071fc77fa33469",
        "type": "inject",
        "z": "553d44862958b541",
        "name": "Add OPC CPU Variable",
        "props": [
            {
                "p": "payload"
            },
            {
                "p": "topic",
                "vt": "str"
            }
        ],
        "repeat": "",
        "crontab": "",
        "once": true,
        "onceDelay": "10",
        "topic": "ns=1;s=CPU;datatype=Double",
        "payload": "{\"opcuaCommand\":\"addVariable\"}",
        "payloadType": "json",
        "x": 710,
        "y": 220,
        "wires": [
            [
                "71968a1ff0599c0c"
            ]
        ]
    },
    {
        "id": "d8737c0f3f1bb468",
        "type": "function",
        "z": "553d44862958b541",
        "name": "Set Memory OPC Variable",
        "func": "var returnMsg = \n    { payload : \n        { \n            \"messageType\": \"Variable\",\n            \"namespace\": \"1\",\n            \"variableName\": \"CPU\",\n            \"variableValue\": msg.payload\n        }\n    }; \nreturn returnMsg;   ",
        "outputs": 1,
        "noerr": 0,
        "initialize": "",
        "finalize": "",
        "libs": [],
        "x": 720,
        "y": 160,
        "wires": [
            [
                "71968a1ff0599c0c",
                "86ed05baf0809afa"
            ]
        ]
    }
]
'''
