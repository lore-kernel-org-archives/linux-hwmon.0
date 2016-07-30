Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:33047 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751014AbcG3Pze (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Sat, 30 Jul 2016 11:55:34 -0400
Subject: Re: [PATCH v2 2/2] hwmon: adt7411: add external thermal diode support
To: Michael Walle <michael@walle.cc>, linux-hwmon@vger.kernel.org
References: <1469437926-3508-1-git-send-email-michael@walle.cc>
 <1469437926-3508-2-git-send-email-michael@walle.cc>
Cc: Jean Delvare <jdelvare@suse.com>, linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <579CCDEA.4050304@roeck-us.net>
Date: Sat, 30 Jul 2016 08:55:22 -0700
MIME-Version: 1.0
In-Reply-To: <1469437926-3508-2-git-send-email-michael@walle.cc>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/25/2016 02:12 AM, Michael Walle wrote:
> If the EXT_TDM bit is set, the chip supports a second temperature sensor
> instead of two voltage sensors.
>
> Signed-off-by: Michael Walle <michael@walle.cc>

Applied to -next.

Thanks,
Guenter


