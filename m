Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:37197 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756125AbcH2KGi (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 29 Aug 2016 06:06:38 -0400
Date: Mon, 29 Aug 2016 12:06:34 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [v4.7.2: Oops] When loading IT87 HARDWARE MONITORING DRIVER
Message-ID: <20160829120634.039204a6@endymion>
In-Reply-To: <CAJ1xhMXZNMYMew4N2SZdhJm9FaiRjr=T63+72UdYpYfC+api_A@mail.gmail.com>
References: <CAJ1xhMXZNMYMew4N2SZdhJm9FaiRjr=T63+72UdYpYfC+api_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hello Alexander,

On Sat, 27 Aug 2016 18:52:42 +0300, Alexander Kapshuk wrote:
> I get an Oops when loading it87.ko on a 4.7.2 kernel. See below for details:

it87_attributes_in lacks its NULL terminator, looks suspicious to me.
Can you try the following quick fix?

---
 drivers/hwmon/it87.c |    1 +
 1 file changed, 1 insertion(+)

--- linux-4.7.orig/drivers/hwmon/it87.c	2016-07-04 08:01:00.000000000 +0200
+++ linux-4.7/drivers/hwmon/it87.c	2016-08-29 12:04:52.926911625 +0200
@@ -2015,6 +2015,7 @@ static struct attribute *it87_attributes
 	&sensor_dev_attr_in10_input.dev_attr.attr,	/* 41 */
 	&sensor_dev_attr_in11_input.dev_attr.attr,	/* 41 */
 	&sensor_dev_attr_in12_input.dev_attr.attr,	/* 41 */
+	NULL
 };
 
 static const struct attribute_group it87_group_in = {

I'm trying to find when the bug was introduced. I have a hard time
believing it went unnoticed for long. If it fixes your problem I'll
send a clean patch.

-- 
Jean Delvare
SUSE L3 Support
