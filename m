Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:37891 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1756626AbcH2KLr (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 29 Aug 2016 06:11:47 -0400
Date: Mon, 29 Aug 2016 12:11:40 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Cc: linux-hwmon@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [v4.7.2: Oops] When loading IT87 HARDWARE MONITORING DRIVER
Message-ID: <20160829121140.38c10554@endymion>
In-Reply-To: <20160829120634.039204a6@endymion>
References: <CAJ1xhMXZNMYMew4N2SZdhJm9FaiRjr=T63+72UdYpYfC+api_A@mail.gmail.com>
        <20160829120634.039204a6@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, 29 Aug 2016 12:06:34 +0200, Jean Delvare wrote:
> I'm trying to find when the bug was introduced. I have a hard time
> believing it went unnoticed for long. If it fixes your problem I'll
> send a clean patch.

Broken by:

commit 52929715634ad36782bd7018ab0bf59a6619c393
Author: Guenter Roeck <linux@roeck-us.net>
Date:   Sat Mar 30 14:00:08 2013 -0700

    hwmon: (it87) Use is_visible for voltage sensors

Only kernel v4.7 is affected. I'll send a clean patch after my lunch.

-- 
Jean Delvare
SUSE L3 Support
