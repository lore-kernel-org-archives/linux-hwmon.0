Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:26191 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727622AbeI0WrM (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Sep 2018 18:47:12 -0400
Subject: Re: [PATCH v8 07/12] dt-bindings: mfd: Add a document for PECI client
 MFD
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee.jones@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Juergen Gross <jgross@suse.com>,
        Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-doc@vger.kernel.org,
        openbmc@lists.ozlabs.org,
        James Feist <james.feist@linux.intel.com>,
        Jason M Biils <jason.m.bills@linux.intel.com>,
        Vernon Mauery <vernon.mauery@linux.intel.com>
References: <20180918215124.14003-1-jae.hyun.yoo@linux.intel.com>
 <20180918215124.14003-8-jae.hyun.yoo@linux.intel.com>
 <20180927151524.GA16798@bogus>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <68edf927-a39a-dc54-9766-507e4fa789a5@linux.intel.com>
Date: Thu, 27 Sep 2018 09:28:06 -0700
MIME-Version: 1.0
In-Reply-To: <20180927151524.GA16798@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 9/27/2018 8:15 AM, Rob Herring wrote:
> On Tue, 18 Sep 2018 14:51:19 -0700, Jae Hyun Yoo wrote:
>> This commit adds a dt-bindings document for PECI client MFD.
>>
>> Cc: Lee Jones <lee.jones@linaro.org>
>> Cc: Rob Herring <robh+dt@kernel.org>
>> Cc: Mark Rutland <mark.rutland@arm.com>
>> Cc: Andrew Jeffery <andrew@aj.id.au>
>> Cc: James Feist <james.feist@linux.intel.com>
>> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
>> Cc: Joel Stanley <joel@jms.id.au>
>> Cc: Vernon Mauery <vernon.mauery@linux.intel.com>
>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> ---
>>   .../bindings/mfd/intel-peci-client.txt        | 34 +++++++++++++++++++
>>   1 file changed, 34 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/mfd/intel-peci-client.txt
>>
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> 

Thanks for the review, Rob!
