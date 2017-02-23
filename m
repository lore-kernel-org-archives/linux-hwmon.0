Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:47089 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751210AbdBWTa6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 23 Feb 2017 14:30:58 -0500
Date: Thu, 23 Feb 2017 11:30:54 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Atsushi Nemoto <nemoto@toshiba-tops.co.jp>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        sato@toshiba-tops.co.jp
Subject: Re: [PATCH v2] hwmon: (w83627ehf) Use request_muxed_region
Message-ID: <20170223193054.GA26892@roeck-us.net>
References: <20170222.133210.966396582369483976.nemoto@toshiba-tops.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170222.133210.966396582369483976.nemoto@toshiba-tops.co.jp>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Feb 22, 2017 at 01:32:10PM +0900, Atsushi Nemoto wrote:
> From: Katsumi Sato <sato@toshiba-tops.co.jp>
> 
> Serialize access to the hardware by using "request_muxed_region".
> Call to this macro will hold off the requestor if the resource is
> currently busy. "superio_enter" will return an error if call to
> "request_muxed_region" fails.
> 
> Signed-off-by: Katsumi Sato <sato@toshiba-tops.co.jp>
> Signed-off-by: Atsushi Nemoto <nemoto@toshiba-tops.co.jp>

Applied to hwmon-next.

Thanks,
Guenter
