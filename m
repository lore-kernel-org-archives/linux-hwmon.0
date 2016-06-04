Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:52207 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750711AbcFDERT (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Sat, 4 Jun 2016 00:17:19 -0400
Subject: Re: [PATCH 1/1 v6] hwmon: add support for Sensirion SHT3x sensors
To: Pascal Sachs <pascalsachs@gmail.com>, jdelvare@suse.com
References: <1464854351-28423-1-git-send-email-pascalsachs@gmail.com>
Cc: corbet@lwn.net, pascal.sachs@sensirion.com,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, David Frey <david.frey@sensirion.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5752564B.8040105@roeck-us.net>
Date: Fri, 3 Jun 2016 21:17:15 -0700
MIME-Version: 1.0
In-Reply-To: <1464854351-28423-1-git-send-email-pascalsachs@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 06/02/2016 12:59 AM, Pascal Sachs wrote:
> From: David Frey <david.frey@sensirion.com>
>
> This driver implements support for the Sensirion SHT3x-DIS chip,
> a humidity and temperature sensor. Temperature is measured
> in degrees celsius, relative humidity is expressed as a percentage.
> In the sysfs interface, all values are scaled by 1000,
> i.e. the value for 31.5 degrees celsius is 31500.
>
> Signed-off-by: Pascal Sachs <pascal.sachs@sensirion.com>

Applied to -next.

Thanks,
Guenter

