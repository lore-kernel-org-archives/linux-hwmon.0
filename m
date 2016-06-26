Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from devils.ext.ti.com ([198.47.26.153]:46273 "EHLO
	devils.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751842AbcFZNdC (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sun, 26 Jun 2016 09:33:02 -0400
Subject: Re: [PATCH v2 1/5] hwmon: (tmp102) Use devm_add_action to register
 cleanup function
To: Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>
References: <1466908825-14222-1-git-send-email-linux@roeck-us.net>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
From: Nishanth Menon <nm@ti.com>
Message-ID: <576FD957.8060107@ti.com>
Date: Sun, 26 Jun 2016 08:32:07 -0500
MIME-Version: 1.0
In-Reply-To: <1466908825-14222-1-git-send-email-linux@roeck-us.net>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/25/2016 09:40 PM, Guenter Roeck wrote:
> By registering a cleanup function with devm_add_action(), we can
> simplify the error path in the probe function and drop the remove
> function entirely.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Acked-by: Nishanth Menon <nm@ti.com>


-- 
Regards,
Nishanth Menon
