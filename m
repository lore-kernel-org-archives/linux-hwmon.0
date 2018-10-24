Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:22533 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726521AbeJYBIi (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 24 Oct 2018 21:08:38 -0400
Subject: Re: [PATCH v8 07/12] dt-bindings: mfd: Add a document for PECI client
 MFD
To: Lee Jones <lee.jones@linaro.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
        Vernon Mauery <vernon.mauery@linux.intel.com>,
        Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jason M Biils <jason.m.bills@linux.intel.com>,
        Eric Sandeen <sandeen@redhat.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Jonathan Corbet <corbet@lwn.net>, openbmc@lists.ozlabs.org,
        linux-doc@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
        "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
        David Kershner <david.kershner@unisys.com>,
        Guenter Roeck <linux@roeck-us.net>, Wu Hao <hao.wu@intel.com>,
        linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Johan Hovold <johan@kernel.org>,
        Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Sagar Dharia <sdharia@codeaurora.org>,
        linux-arm-kernel@lists.infradead.org,
        Juergen Gross <jgross@suse.com>,
        Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
        Andrew Jeffery <andrew@aj.id.au>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Darrick J . Wong" <darrick.wong@oracle.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        James Feist <james.feist@linux.intel.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        "David S . Miller" <davem@davemloft.net>
References: <20180918215124.14003-1-jae.hyun.yoo@linux.intel.com>
 <20180918215124.14003-8-jae.hyun.yoo@linux.intel.com>
 <20181024072540.GA4939@dell>
From: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <8c322777-7c35-1c2a-730f-f8de86522b96@linux.intel.com>
Date: Wed, 24 Oct 2018 09:39:51 -0700
MIME-Version: 1.0
In-Reply-To: <20181024072540.GA4939@dell>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Lee,

On 10/24/2018 12:25 AM, Lee Jones wrote:
> On Tue, 18 Sep 2018, Jae Hyun Yoo wrote:
> 
>> +Required properties:
>> +- compatible : Should be "intel,peci-client".
>> +- reg        : Should contain address of a client CPU. Address range of CPU
>> +	       clients starts from 0x30 based on PECI specification.
> 
> Nit: "start"
> 
> Would be better worded:
> 
> "According to the PECI specification client addresses start from 0x30."
> 

Yes, that would be better. Will fix it like you suggested.

Thanks for the review!

Jae
