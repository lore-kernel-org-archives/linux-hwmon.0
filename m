Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:38702 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387885AbeKVKSo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Nov 2018 05:18:44 -0500
Date: Wed, 21 Nov 2018 15:42:08 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, corbet@lwn.net,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: hwmon: Add descriptions for ina2xx sysfs
 entries
Message-ID: <20181121234208.GA4920@roeck-us.net>
References: <20181119203116.25589-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181119203116.25589-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 19, 2018 at 12:31:16PM -0800, Nicolin Chen wrote:
> There are a few sysfs entries being exposed to user space by the
> ina2xx hwmon driver while not getting explicitly documented. So
> this patch just adds a description section for them.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>

Applied to hwmon-next.

Thanks,
Guenter
