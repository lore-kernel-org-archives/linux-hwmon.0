Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:33492 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966279AbcKXPkf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 24 Nov 2016 10:40:35 -0500
Subject: Re: [PATCH] hwmon: (lm90) Mention support for TI TMP451 in Kconfig
 description
To: Tobias Klauser <tklauser@distanz.ch>,
        Jean Delvare <jdelvare@suse.com>
References: <20161124133425.6475-1-tklauser@distanz.ch>
Cc: linux-hwmon@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <441ab8c1-849c-b7e3-cc3c-01c8acf5c761@roeck-us.net>
Date: Thu, 24 Nov 2016 07:40:32 -0800
MIME-Version: 1.0
In-Reply-To: <20161124133425.6475-1-tklauser@distanz.ch>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 11/24/2016 05:34 AM, Tobias Klauser wrote:
> The lm90 driver also supports the Texas Instruments TMP451 sensor chip.
> Since the Kconfig description for the driver includes a list of all
> compatible chips, mention the TI TMP451 there as well.
>
> Signed-off-by: Tobias Klauser <tklauser@distanz.ch>

Applied to -next.

Guenter

