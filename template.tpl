___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "TAG",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "changeChain",
  "brand": {
    "id": "brand_dummy",
    "displayName": ""
  },
  "description": "",
  "categories": ["ANALYTICS", "TAG_MANAGEMENT"],
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "RADIO",
    "name": "takeoverOpen",
    "displayName": "是否接管页面的window.open事件",
    "radioItems": [
      {
        "value": true,
        "displayValue": "是"
      },
      {
        "value": false,
        "displayValue": "否"
      }
    ],
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "projectId",
    "displayName": "转链的项目ID",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "euid",
    "displayName": "反馈标签",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "siteId",
    "displayName": "转链的媒体ID",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "include",
    "displayName": "只转链指定的域名",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "exclude",
    "displayName": "转链排除的域名",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "transferApi",
    "displayName": "接口请求地址",
    "simpleValueType": true
  },
  {
    "type": "TEXT",
    "name": "host",
    "displayName": "中转页地址",
    "simpleValueType": true
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

const copyFromWindow = require('copyFromWindow');
const injectScript = require('injectScript');

const options = {
  takeoverOpen: data.takeoverOpen,
  projectId: data.projectId,
  transferApi: data.transferApi,
  host: data.host,
  include: data.include,
  exclude: data.exclude,
  euid: data.euid,
  siteId: data.siteId
};

const scriptUrl = 'https://fentu-img.maibuymai.com/cpslink.js';

injectScript(scriptUrl, 
  function onSuccess() {
    const cpslink = copyFromWindow('cpslink');
    const link = cpslink.config(options).debug();
  }, data.gtmOnFailure
);

data.gtmOnSuccess();


___WEB_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "access_globals",
        "versionId": "1"
      },
      "param": [
        {
          "key": "keys",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 3,
                "mapKey": [
                  {
                    "type": 1,
                    "string": "key"
                  },
                  {
                    "type": 1,
                    "string": "read"
                  },
                  {
                    "type": 1,
                    "string": "write"
                  },
                  {
                    "type": 1,
                    "string": "execute"
                  }
                ],
                "mapValue": [
                  {
                    "type": 1,
                    "string": "cpslink"
                  },
                  {
                    "type": 8,
                    "boolean": true
                  },
                  {
                    "type": 8,
                    "boolean": false
                  },
                  {
                    "type": 8,
                    "boolean": false
                  }
                ]
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "inject_script",
        "versionId": "1"
      },
      "param": [
        {
          "key": "urls",
          "value": {
            "type": 2,
            "listItem": [
              {
                "type": 1,
                "string": "https://fentu-img.maibuymai.com/cpslink.js"
              }
            ]
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Untitled test 1
  code: |-
    const mockData = {
      // Mocked field values
    };

    // Call runCode to run the template's code.
    runCode(mockData);

    // Verify that the tag finished successfully.
    assertApi('gtmOnSuccess').wasCalled();


___NOTES___

Created on 2024/8/9 14:39:23
