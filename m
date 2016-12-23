Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:41970 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S941808AbcLWCiL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Dec 2016 21:38:11 -0500
Subject: Re: [PATCH 00/66] use permission-specific DEVICE_ATTR variants
To: Julia Lawall <Julia.Lawall@lip6.fr>, linux-kernel@vger.kernel.org
References: <1482408335-3435-1-git-send-email-Julia.Lawall@lip6.fr>
Cc: kernel-janitors@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Jean Delvare <jdelvare@suse.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <42ae040d-9939-5e8e-2157-8f635a3f6ab4@roeck-us.net>
Date: Thu, 22 Dec 2016 18:38:07 -0800
MIME-Version: 1.0
In-Reply-To: <1482408335-3435-1-git-send-email-Julia.Lawall@lip6.fr>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 12/22/2016 04:04 AM, Julia Lawall wrote:
> Use DEVICE_ATTR_RO etc. for read only attributes etc.  This simplifies the
> source code, improves readbility, and reduces the chance of
> inconsistencies.  A previous version of this semantic patch transformed
> only cases where the show and store functions followed particular naming
> conventions.  This semantic patch additionally renames functions as
> needed.  It can, however, fail to transform some occurrences where a single
> function is used for multiple attributes.  In that case, the first case is
> transformed an the others are left as is.
>
> The complete semantic patch is as follows:
> (http://coccinelle.lip6.fr/)
>

Hi Julia,

I noticed that drivers/hwmon/gl518sm.c was not converted. Running your script
on it does not do anything. Any idea what might cause that ?

I noticed that I get a warning if I specify a debug file:

File "devattr-new.cocci", line 36, characters 5-6:
Warning 26: unused variable x.

but that seems to have no impact and is always seen. I think it is caused
by the following.

...

@script:ocaml@
x << d.x;	<====
show << o.show;
store << o.store;
@@

if (not(show = "NULL") && Hashtbl.mem taken show) ||
    (not(store = "NULL") && Hashtbl.mem taken store)
then Coccilib.include_match false
else (Hashtbl.add taken show (); Hashtbl.add taken store ())

...

How does one specify indentation preferences ? Also, how do I generate
an actual patch (instead of getting the output on screen) ?
Sorry for the maybe dumb questions ;-).

Thanks,
Guenter

