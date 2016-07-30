Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:36391 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751055AbcG3P7D (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sat, 30 Jul 2016 11:59:03 -0400
Subject: Re: [patch] hwmon: (pmbus) Add explicit support for DPS-460, DPS-800,
 and SGD009
To: Vadim Pasternak <vadimp@mellanox.com>
References: <1469444153-171240-1-git-send-email-vadimp@mellanox.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, jiri@resnulli.us
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <579CCEBF.1050806@roeck-us.net>
Date: Sat, 30 Jul 2016 08:58:55 -0700
MIME-Version: 1.0
In-Reply-To: <1469444153-171240-1-git-send-email-vadimp@mellanox.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/25/2016 03:55 AM, Vadim Pasternak wrote:
> Provide support for PSU DPS-460, DPS-800 from Delta Electronics, INC and for
> SGD009 from Acbel Polytech, INC.
> These devices do not support the STATUS_CML register, and reports a
> communication error in response to this command.
> For this reason, the status register check is disabled for these controllers.
>
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> Reviewed-by: Jiri Pirko <jiri@mellanox.com>

Applied to -next.

Thanks,
Guenter


