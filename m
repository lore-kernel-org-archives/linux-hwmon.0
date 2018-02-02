Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from out3-smtp.messagingengine.com ([66.111.4.27]:51401 "EHLO
        out3-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750799AbeBBKNS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 2 Feb 2018 05:13:18 -0500
Date: Fri, 2 Feb 2018 11:13:06 +0100
From: Danilo Bargen <mail@dbrgn.ch>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
        andreas.brauchli@sensirion.com
Subject: Re: [PATCH] hwmon: (sht21) Update data sheet URLs
Message-ID: <20180202111306.6699fb4d@x2000>
In-Reply-To: <8168b9b5-66c4-a6be-07d7-67eee60f9471@roeck-us.net>
References: <20180126233100.17995-1-mail@dbrgn.ch>
        <8168b9b5-66c4-a6be-07d7-67eee60f9471@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hello Guenter

> Some prosa expected here.
> ...
> This does a bit more than updating the link to the datasheet.

Thanks, I will submit a patch with some more explanation in the commit message
and without the license header change (which was suggested by scripts/checkpatch.pl).

Danilo
