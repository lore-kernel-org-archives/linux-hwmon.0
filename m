Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:47259 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751975AbeCMJbi (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Mar 2018 05:31:38 -0400
Subject: Re: hwmon/sch5627: Use common error handling code in sch5627_probe()
To: Hans de Goede <hdegoede@redhat.com>, linux-hwmon@vger.kernel.org
Cc: =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Cameron <jic23@kernel.org>,
        kernel-janitors@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
References: <d08248a2-46d8-6f73-81f4-84ad21b7e640@users.sourceforge.net>
 <0cc0ab31-550b-fa34-aaa5-164f6ae7f7a9@redhat.com>
 <17810b74-7b72-074e-5fef-b614fcfed738@users.sourceforge.net>
 <e8a45f50-b625-ccb5-88cc-b888f57d1ca1@redhat.com>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <4e0856d8-3b2c-35f0-50a5-bfbe34615dfa@users.sourceforge.net>
Date: Tue, 13 Mar 2018 10:30:32 +0100
MIME-Version: 1.0
In-Reply-To: <e8a45f50-b625-ccb5-88cc-b888f57d1ca1@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

>  1 file changed, 29 insertions(+), 31 deletions(-)
> 
> So you are asking people to review 60 changed lines to save 2,

A bit of object code reduction might become useful also in this case.


> that alone should be the point where you stop yourself from
> *even* sending this patch.

I proposed just another collateral evolution.


> Next time before you send a patch please carefully think if the
> saving is worth the combination of reviewers time + the risk of
> regressions (and keep in mind that both the reviewers time and
> the risk of regressions cost increase for more complex changes).

Source code transformations were integrated in other software areas
according to such a change pattern.


> As for this specific discussion, there are certain "design-patterns"
> in the kernel, goto style error handling is one of them, the pattern
> there ALWAYS is:
…
> Notice the fall-thoughs those are ALWAYS there, never, ever is
> there a goto after a cleanup label.

It seems that I present an unusual update suggestion as a software
design variant.


> Your patches black goto magic completely messes this up

You can view the proposal in such a way.


> and clearly falls under the CS101 rule: never use goto.

There might a target conflict with information from the section
“7) Centralized exiting of functions” in the document “coding-style.rst”.

Regards,
Markus
