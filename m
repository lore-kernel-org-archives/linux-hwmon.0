Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33696 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1753558AbdHUSf1 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 21 Aug 2017 14:35:27 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.21/8.16.0.21) with SMTP id v7LIYEh5106142
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Aug 2017 14:35:27 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2cg1akp5v6-1
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
        for <linux-hwmon@vger.kernel.org>; Mon, 21 Aug 2017 14:35:26 -0400
Received: from localhost
        by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <linux-hwmon@vger.kernel.org> from <eajames@linux.vnet.ibm.com>;
        Mon, 21 Aug 2017 14:35:26 -0400
Subject: Re: [PATCH v2 1/3] dt-bindings: i2c: Document the POWER system power
 supply device
To: Rob Herring <robh@kernel.org>
Cc: linux@roeck-us.net, jdelvare@suse.com,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        joel@jms.id.au, jk@ozlabs.org, andrew@aj.id.au,
        mark.rutland@arm.com, devicetree@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org, "Edward A. James" <eajames@us.ibm.com>
References: <1502403586-20549-1-git-send-email-eajames@linux.vnet.ibm.com>
 <1502403586-20549-2-git-send-email-eajames@linux.vnet.ibm.com>
 <20170817151116.4vc4jlna4gc7xzb2@rob-hp-laptop>
From: Eddie James <eajames@linux.vnet.ibm.com>
Date: Mon, 21 Aug 2017 13:35:18 -0500
MIME-Version: 1.0
In-Reply-To: <20170817151116.4vc4jlna4gc7xzb2@rob-hp-laptop>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Message-Id: <81d68d38-af6d-be62-ad54-928b20b29d63@linux.vnet.ibm.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org



On 08/17/2017 10:11 AM, Rob Herring wrote:
> On Thu, Aug 10, 2017 at 05:19:44PM -0500, Eddie James wrote:
>> From: "Edward A. James" <eajames@us.ibm.com>
>>
>> Signed-off-by: Edward A. James <eajames@us.ibm.com>
>> ---
>>   .../devicetree/bindings/i2c/ibm,power-ps.txt        | 21 +++++++++++++++++++++
>>   1 file changed, 21 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/i2c/ibm,power-ps.txt
>>
>> diff --git a/Documentation/devicetree/bindings/i2c/ibm,power-ps.txt b/Documentation/devicetree/bindings/i2c/ibm,power-ps.txt
>> new file mode 100644
>> index 0000000..2ea8ea2
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/i2c/ibm,power-ps.txt
>> @@ -0,0 +1,21 @@
>> +Device-tree bindings for IBM POWER system power supplies
>> +--------------------------------------------------------
>> +
>> +Required properties:
>> + - compatible = "ibm,power-ps";
>> + - reg = < I2C bus address >;		: Address of the power supply on the
>> +					  I2C bus.
>> +
>> +Example:
>> +
>> +    i2c-bus@100 {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +        #interrupt-cells = <1>;
>> +        < more properties >
>> +
>> +        power_ps@68 {
> Don't use '_' in node names. Should be a generic name too if possible.
> Perhaps "power-supply".

Yes, the latest patch set switched this to power-supply. The driver name 
changed in v3, sorry for the confusion.

Thanks,
Eddie

>
>> +            compatible = "ibm,power-ps";
>> +            reg = <0x68>;
>> +        };
>> +    };
>> -- 
>> 1.8.3.1
>>

