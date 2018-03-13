Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:46147 "EHLO mout.web.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752059AbeCMI0y (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 13 Mar 2018 04:26:54 -0400
Subject: Re: hwmon/sch5627: Use common error handling code in sch5627_probe()
To: Hans de Goede <hdegoede@redhat.com>, linux-hwmon@vger.kernel.org
Cc: =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
References: <d08248a2-46d8-6f73-81f4-84ad21b7e640@users.sourceforge.net>
 <0cc0ab31-550b-fa34-aaa5-164f6ae7f7a9@redhat.com>
From: SF Markus Elfring <elfring@users.sourceforge.net>
Message-ID: <17810b74-7b72-074e-5fef-b614fcfed738@users.sourceforge.net>
Date: Tue, 13 Mar 2018 09:25:51 +0100
MIME-Version: 1.0
In-Reply-To: <0cc0ab31-550b-fa34-aaa5-164f6ae7f7a9@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

>> Adjust jump targets so that a bit of exception handling can be better
>> reused at the end of this function.
…
> goto-s going to a label calling another goto is completely unreadable.

I got an other software development view.


> I really do not see any reason for the proposed changes,

I suggest to look once more.


> they may remove a small amount of code duplication,

This was my software design goal in this case.


> but at a hugh cost wrt readability.

I proposed a different trade-off here.

Regards,
Markus
