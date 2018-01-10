Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:37006 "EHLO
        mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933317AbeAJKR5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Jan 2018 05:17:57 -0500
Date: Wed, 10 Jan 2018 11:17:55 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc: joel@jms.id.au, andrew@aj.id.au, arnd@arndb.de, jdelvare@suse.com,
        linux@roeck-us.net, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        openbmc@lists.ozlabs.org, Jae Hyun Yoo <jae.hyun.yoo@intel.com>
Subject: Re: [PATCH linux dev-4.10 0/6] Add support PECI and PECI hwmon
 drivers
Message-ID: <20180110101755.GA5822@kroah.com>
References: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180109223126.13093-1-jae.hyun.yoo@linux.intel.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Jan 09, 2018 at 02:31:20PM -0800, Jae Hyun Yoo wrote:
> From: Jae Hyun Yoo <jae.hyun.yoo@intel.com>
> 
> Hello,
> 
> This patch set provides support for PECI of AST2400/2500 which can give us PECI
> functionalities such as temperature monitoring, platform manageability,
> processor diagnostics and failure analysis. Also provides generic peci.h and
> peci_ioctl.h headers to provide compatibility to peci drivers that can be
> implemented later e.g. Nuvoton's BMC SoC family.

What is the "dev-4.10" in the subject for?  4.10 is really old and
obsolete :(

thanks,

greg k-h
