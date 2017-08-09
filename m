Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from vps-vb.mhejs.net ([37.28.154.113]:50669 "EHLO vps-vb.mhejs.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751948AbdHIR6n (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 9 Aug 2017 13:58:43 -0400
Subject: Re: [PATCH v7] hwmon: (it87) Reapply probe path chip registers
 settings after resume
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
References: <20170809173948.GA11562@roeck-us.net>
From: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Message-ID: <90622e85-673e-85b0-d59f-e2af04872f82@maciej.szmigiero.name>
Date: Wed, 9 Aug 2017 19:58:38 +0200
MIME-Version: 1.0
In-Reply-To: <20170809173948.GA11562@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09.08.2017 19:39, Guenter Roeck wrote:
> On Wed, Aug 09, 2017 at 05:15:46PM +0200, Maciej S. Szmigiero wrote:
(..)
>>
>> Changes from v6: Add __maybe_unused to it87_resume_sio(), move a message
>> about failure to enter Super I/O on resume to this function, make it clear
>> what had actually failed and downgrade it to a warning.
>>
> Return value from it87_resume_sio() is now unused, thus it is pointless
> to have it return an error.
> 
> No need to resend; applied after making that change.
>
> Thanks,
> Guenter

Thanks,
Maciej
