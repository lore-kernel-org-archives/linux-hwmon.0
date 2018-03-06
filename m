Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:39226 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750797AbeCFU2T (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 6 Mar 2018 15:28:19 -0500
Subject: Re: [PATCH v2 6/8] [PATCH 6/8] Documentation: hwmon: Add a document
 for PECI hwmon client driver
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, joel@jms.id.au,
        andrew@aj.id.au, arnd@arndb.de, gregkh@linuxfoundation.org,
        jdelvare@suse.com, linux@roeck-us.net, benh@kernel.crashing.org,
        andrew@lunn.ch
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
References: <20180221161606.32247-1-jae.hyun.yoo@linux.intel.com>
 <20180221161606.32247-7-jae.hyun.yoo@linux.intel.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0e3750a0-d45b-368d-f5cb-d2cca6797ecb@infradead.org>
Date: Tue, 6 Mar 2018 12:28:15 -0800
MIME-Version: 1.0
In-Reply-To: <20180221161606.32247-7-jae.hyun.yoo@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi,

On 02/21/2018 08:16 AM, Jae Hyun Yoo wrote:

> +temp<n>_label		Provides DDR DIMM temperature if this label indicates
> +			'DIMM #'.
> +temp<n>_input		Provides current temperature of the DDR DIMM.
> +
> +Note:
> +	DIMM temperature group will be appeared when the client CPU's BIOS

	                       will appear when

> +	completes memory training and testing.
> 


-- 
~Randy
