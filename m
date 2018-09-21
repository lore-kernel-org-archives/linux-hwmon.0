Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f171.google.com ([209.85.210.171]:46195 "EHLO
        mail-pf1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727392AbeIUTIk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Sep 2018 15:08:40 -0400
Date: Fri, 21 Sep 2018 06:19:48 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: zhong jiang <zhongjiang@huawei.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] hwmon: scpi-hwmon:  remove redundant continue
Message-ID: <20180921131948.GA16088@roeck-us.net>
References: <1537493403-15745-1-git-send-email-zhongjiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1537493403-15745-1-git-send-email-zhongjiang@huawei.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Sep 21, 2018 at 09:30:03AM +0800, zhong jiang wrote:
> The continue will not truely skip any code. hence it is safe to
> remove it.
> 
> Signed-off-by: zhong jiang <zhongjiang@huawei.com>

Applied to hwmon-next.

Thanks,
Guenter
