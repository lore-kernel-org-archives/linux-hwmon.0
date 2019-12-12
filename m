Return-Path: <SRS0=GaDF=2C=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19592C43603
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Dec 2019 18:51:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ECD7F206C3
	for <linux-hwmon@archiver.kernel.org>; Thu, 12 Dec 2019 18:51:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730658AbfLLSvx (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 12 Dec 2019 13:51:53 -0500
Received: from mga18.intel.com ([134.134.136.126]:37490 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730546AbfLLSvw (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 12 Dec 2019 13:51:52 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Dec 2019 10:51:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,306,1571727600"; 
   d="scan'208";a="364064186"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147]) ([10.7.153.147])
  by orsmga004.jf.intel.com with ESMTP; 12 Dec 2019 10:51:51 -0800
Subject: Re: [PATCH v11 06/14] peci: Add Aspeed PECI adapter driver
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Jonathan Corbet <corbet@lwn.net>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        "Darrick J . Wong" <darrick.wong@oracle.com>,
        Eric Sandeen <sandeen@redhat.com>,
        Arnd Bergmann <arnd@arndb.de>, Wu Hao <hao.wu@intel.com>,
        Tomohiro Kusumi <kusumi.tomohiro@gmail.com>,
        "Bryant G . Ly" <bryantly@linux.vnet.ibm.com>,
        Frederic Barrat <fbarrat@linux.vnet.ibm.com>,
        "David S . Miller" <davem@davemloft.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Vinod Koul <vkoul@kernel.org>,
        Stephen Boyd <sboyd@codeaurora.org>,
        David Kershner <david.kershner@unisys.com>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
        Sagar Dharia <sdharia@codeaurora.org>,
        Johan Hovold <johan@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Juergen Gross <jgross@suse.com>,
        Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
        Tomer Maimon <tmaimon77@gmail.com>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        openbmc@lists.ozlabs.org, Robin Murphy <robin.murphy@arm.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>
References: <20191211194624.2872-1-jae.hyun.yoo@linux.intel.com>
 <20191211194624.2872-7-jae.hyun.yoo@linux.intel.com>
 <20191211202818.GD32742@smile.fi.intel.com>
 <e05cdec0-1120-7e2d-bac0-e4a1ba1ceb3d@linux.intel.com>
 <20191212084758.GE32742@smile.fi.intel.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <bce54a12-a58b-a4a5-4e75-103499747ca6@linux.intel.com>
Date:   Thu, 12 Dec 2019 10:51:51 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191212084758.GE32742@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Andy,

On 12/12/2019 12:47 AM, Andy Shevchenko wrote:
> On Wed, Dec 11, 2019 at 04:50:04PM -0800, Jae Hyun Yoo wrote:
>> On 12/11/2019 12:28 PM, Andy Shevchenko wrote:
>>> On Wed, Dec 11, 2019 at 11:46:16AM -0800, Jae Hyun Yoo wrote:
> 
>>> Like in the previous patch...
> 
> (1)
> 
>> I see. I'll simplify this function like below:
>>
>> #include <linux/iopoll.h>
>>
>> static inline int aspeed_peci_check_idle(struct aspeed_peci *priv)
>> {
>> 	u32 cmd_sts;
>>
>> 	return readl_poll_timeout(priv->base + ASPEED_PECI_CMD,
>> 				  cmd_sts,
>> 				  !(cmd_sts & ASPEED_PECI_CMD_IDLE_MASK),
>> 				  ASPEED_PECI_IDLE_CHECK_INTERVAL_USEC,
>> 				  ASPEED_PECI_IDLE_CHECK_TIMEOUT_USEC);
>> }
> 
> Good for *this* case, but please fix all the rest accordingly.

Sure. Will do that.

Thanks,

Jae
