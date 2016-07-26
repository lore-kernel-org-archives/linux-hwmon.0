Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:46024 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754528AbcGZHSf (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Tue, 26 Jul 2016 03:18:35 -0400
Date: Tue, 26 Jul 2016 09:18:31 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: linux@roeck-us.net, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, jiri@resnulli.us
Subject: Re: [patch] hwmon: (pmbus) Add explicit support for DPS-460,
 DPS-800, and SGD009
Message-ID: <20160726091831.12ca477b@endymion>
In-Reply-To: <1469444153-171240-1-git-send-email-vadimp@mellanox.com>
References: <1469444153-171240-1-git-send-email-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, 25 Jul 2016 10:55:53 +0000, Vadim Pasternak wrote:
> Provide support for PSU DPS-460, DPS-800 from Delta Electronics, INC and for
> SGD009 from Acbel Polytech, INC.
> These devices do not support the STATUS_CML register, and reports a
> communication error in response to this command.
> For this reason, the status register check is disabled for these controllers.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> Reviewed-by: Jiri Pirko <jiri@mellanox.com>
> ---
>  drivers/hwmon/pmbus/pmbus.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> (...)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

I leave the final ack to Guenter.

-- 
Jean Delvare
SUSE L3 Support
