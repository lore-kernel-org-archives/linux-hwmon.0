Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60635C4338F
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Jul 2021 04:59:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31D3760EB2
	for <linux-hwmon@archiver.kernel.org>; Mon, 26 Jul 2021 04:59:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229580AbhGZESe (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 26 Jul 2021 00:18:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229579AbhGZESd (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Jul 2021 00:18:33 -0400
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com [IPv6:2607:f8b0:4864:20::834])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01A77C061757
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Jul 2021 21:59:01 -0700 (PDT)
Received: by mail-qt1-x834.google.com with SMTP id t18so6229643qta.8
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Jul 2021 21:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YZ9GPuyGsi96v/i+Zn01wbViJ9FhgrLs9kujRXwLnNI=;
        b=MEE2KqePRIFhLv1tmX3DPHbT1APxlLXeDRR7Kg5ZE5sc/UYWCo0FFNYxeQttTpbTz+
         w6gU2ACaUtUA/7eGNPdLNVGhBB+vsoL7SXhHy/WLUBOmHa62esusHTs0X4V3ox2gSiPM
         XU79KKCpmUGyTRAguO1rBCEXzx7HejwGEW7NEL/WaS9iNGxA8NgzG+FcNaB3umaQhR7x
         Pfc0EtpFyfwWnVthbzRzUuvxeJlmtf9ljoY0g0FmyGxvSAUyS/EjsDFGrs4ixhaYkszI
         ShIeRUmBIQPwMUsWESk71oPYY8r3E4ntBIGHje1t5o9UVvCOPOjS0/zaUFgTu+vJXped
         LoNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YZ9GPuyGsi96v/i+Zn01wbViJ9FhgrLs9kujRXwLnNI=;
        b=b1uBuYYYcFD3IoPYJvsl8g8Kp0iygdhWpY9T8N9gvNw4b95YVd4EU4tk1O1uW/fkMr
         Xsxab2RnGXHg+9eeutuicpzrxK7XWDPplzrWarWHEvu2uN+NK18K5agwz04C0jONWkI3
         rMeTveLGLju1ePdrj0zbL6KryZOO03/4cIhIstwQvShKBEXtTDMMBEPG7ESiy2sAI1AN
         b6GpylWzucu2yRryDVoRGA2v4EpNZNIVAimGv4WQYIoiUT59Om70NZ6jVzf4ES2z3Ysg
         JVWG0qeeq+RtMAIde3lUbXT3oc/HnTri2lTAswzAQTKgSIJvlA3gTZmd61FyHrOxcwPC
         2gvQ==
X-Gm-Message-State: AOAM533fXpclMAy0BwpPmnh2/JymK1wqgqKH8z7+CmfVtDIF/DLIjlt4
        cSlW7Dom9u9EJ0pGqhSAwYE=
X-Google-Smtp-Source: ABdhPJzuhDrAnRZVV1JwDeDvSEb/q+trbOnSUDbqNdzbjWyz3Sln6jCD643hGXmclhj2UXcDi6P2lQ==
X-Received: by 2002:ac8:5991:: with SMTP id e17mr13748929qte.6.1627275540933;
        Sun, 25 Jul 2021 21:59:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t14sm10790757qkm.7.2021.07.25.21.58.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jul 2021 21:59:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: sbrmi: Add SB-RMI hwmon driver
 bindings
To:     "Chatradhi, Naveen Krishna" <NaveenKrishna.Chatradhi@amd.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc:     "Gupta, Akshay" <Akshay.Gupta@amd.com>
References: <20210625132544.18094-1-nchatrad@amd.com>
 <20210720055737.8666-1-nchatrad@amd.com>
 <20210720055737.8666-3-nchatrad@amd.com>
 <a56d3b58-06cf-6d4e-0858-31d658746396@roeck-us.net>
 <BL1PR12MB52865705B0A49244B5E49C26E8E89@BL1PR12MB5286.namprd12.prod.outlook.com>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <040af8bf-dd55-aacb-9f7c-688781ae0a96@roeck-us.net>
Date:   Sun, 25 Jul 2021 21:58:58 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <BL1PR12MB52865705B0A49244B5E49C26E8E89@BL1PR12MB5286.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 7/25/21 9:36 PM, Chatradhi, Naveen Krishna wrote:
> [AMD Official Use Only]
> 

You really should get rid of this...

> Hi Guenter,
> 
> Regards,
> Naveenk
> 
> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Monday, July 26, 2021 3:07 AM
> To: Chatradhi, Naveen Krishna <NaveenKrishna.Chatradhi@amd.com>; linux-hwmon@vger.kernel.org
> Cc: Gupta, Akshay <Akshay.Gupta@amd.com>
> Subject: Re: [PATCH v3 3/3] dt-bindings: sbrmi: Add SB-RMI hwmon driver bindings
> 
> [CAUTION: External Email]
> 
> On 7/19/21 10:57 PM, Naveen Krishna Chatradhi wrote:
>> From: Akshay Gupta <Akshay.Gupta@amd.com>
>>
>> - Document device tree bindings for AMD SB-RMI emulated service.
>>
>> Signed-off-by: Akshay Gupta <Akshay.Gupta@amd.com>
>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> 
> Devicetree files need to be approved by a dt maintainer.
> They can't do that if they are not copied on devicetree patches.
> [naveenk:] Yes, my bad. Can I add the devicetree list now here or should I submit v4
> of the patch-set with your reviewed-by on other 2 patches and copying the devicetree list.
> 

Probably better to submit v4

Guenter

> Guenter
> 
>> ---
>> Changes since v2:
>> None
>>
>>    .../devicetree/bindings/hwmon/amd,sbrmi.yaml  | 53 +++++++++++++++++++
>>    1 file changed, 53 insertions(+)
>>    create mode 100644
>> Documentation/devicetree/bindings/hwmon/amd,sbrmi.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/hwmon/amd,sbrmi.yaml
>> b/Documentation/devicetree/bindings/hwmon/amd,sbrmi.yaml
>> new file mode 100644
>> index 000000000000..7598b083979c
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/amd,sbrmi.yaml
>> @@ -0,0 +1,53 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>> +---
>> +$id:
>> +https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevi
>> +cetree.org%2Fschemas%2Fhwmon%2Famd%2Csbrmi.yaml%23&amp;data=04%7C01%7
>> +CNaveenKrishna.Chatradhi%40amd.com%7C8a8332e2358f4c37030d08d94fb456ac
>> +%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637628458245183191%7CUn
>> +known%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
>> +WwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Xwsc2G6T34oiV4aTzYLEb%2FLpoTj%2BW%
>> +2B6LmRkAFyeauQ8%3D&amp;reserved=0
>> +$schema:
>> +https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevi
>> +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=04%7C01%7CNaveenKri
>> +shna.Chatradhi%40amd.com%7C8a8332e2358f4c37030d08d94fb456ac%7C3dd8961
>> +fe4884e608e11a82d994e183d%7C0%7C0%7C637628458245183191%7CUnknown%7CTW
>> +FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI
>> +6Mn0%3D%7C1000&amp;sdata=ieeFYJjYCyDzHrcGjvHWkkU6QHqXcBqOa4Kfsmqk3Ek%
>> +3D&amp;reserved=0
>> +
>> +title: >
>> +  Sideband Remote Management Interface (SB-RMI) compliant
>> +  AMD SoC power device.
>> +
>> +maintainers:
>> +  - Akshay Gupta <Akshay.Gupta@amd.com>
>> +
>> +description: |
>> +  SB Remote Management Interface (SB-RMI) is an SMBus compatible
>> +  interface that reports AMD SoC's Power (normalized Power) using,
>> +  Mailbox Service Request and resembles a typical 8-pin remote power
>> +  sensor's I2C interface to BMC. The power attributes in hwmon
>> +  reports power in microwatts.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - amd,sbrmi
>> +
>> +  reg:
>> +    maxItems: 1
>> +    description: |
>> +      I2C bus address of the device as specified in Section SBI SMBus Address
>> +      of the SoC register reference. The SB-RMI address is normally 78h for
>> +      socket 0 and 70h for socket 1, but it could vary based on hardware
>> +      address select pins.
>> +      \[open source SoC register reference\]
>> +
>> + https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fww
>> + w.amd.com%2Fen%2Fsupport%2Ftech-docs%3Fkeyword%3D55898&amp;data=04%7
>> + C01%7CNaveenKrishna.Chatradhi%40amd.com%7C8a8332e2358f4c37030d08d94f
>> + b456ac%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C6376284582451831
>> + 91%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBT
>> + iI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=eG384k%2FtNMNJD17u7qdIhjI
>> + p2sz%2B6Qs5PpAprL54saU%3D&amp;reserved=0
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    i2c0 {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        sbrmi@3c {
>> +                compatible = "amd,sbrmi";
>> +                reg = <0x3c>;
>> +        };
>> +    };
>> +...
>>

