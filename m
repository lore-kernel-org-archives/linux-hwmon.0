Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:56791 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1032597AbdD0Muj (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Apr 2017 08:50:39 -0400
Date: Thu, 27 Apr 2017 14:50:30 +0200
From: Jean Delvare <jdelvare@suse.de>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: linux-hwmon@vger.kernel.org,
        =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH 0/4] hwmon-NCT: Fine-tuning for four function
 implementations
Message-ID: <20170427145030.5507a32e@endymion>
In-Reply-To: <2f58a509-4aba-5c44-bc79-568b260ab692@users.sourceforge.net>
References: <2f58a509-4aba-5c44-bc79-568b260ab692@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, 27 Apr 2017 11:27:21 +0200, SF Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 27 Apr 2017 11:18:22 +0200
> 
> A few update suggestions were taken into account
> from static source code analysis.
> 
> Markus Elfring (4):
>   Use devm_kcalloc() in nct6683_create_attr_group()
>   Adjust five checks for null pointers
>   Use devm_kcalloc() in nct6775_create_attr_group()
>   Adjust seven checks for null pointers
> 
>  drivers/hwmon/nct6683.c | 15 +++++++--------
>  drivers/hwmon/nct6775.c | 19 +++++++++----------
>  2 files changed, 16 insertions(+), 18 deletions(-)

Nack. You have proven in the past on various lists that 1* you have no
understanding about the changes you are proposing and 2* you have no
skills to discuss any problem that could be found in your patches.

So I'll make it straight: we will not take any patch from you. You are
an annoyance we don't need. Do not waste our time. Go away.

-- 
Jean Delvare
SUSE L3 Support
