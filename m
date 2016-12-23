Return-path: <julia.lawall@lip6.fr>
Date: Fri, 23 Dec 2016 07:39:20 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
To: Guenter Roeck <linux@roeck-us.net>
cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
    linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>
Subject: Re: [PATCH 00/66] use permission-specific DEVICE_ATTR variants
In-Reply-To: <42ae040d-9939-5e8e-2157-8f635a3f6ab4@roeck-us.net>
Message-ID: <alpine.DEB.2.20.1612230732030.1983@hadrien>
References: <1482408335-3435-1-git-send-email-Julia.Lawall@lip6.fr> <42ae040d-9939-5e8e-2157-8f635a3f6ab4@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-hwmon@vger.kernel.org>

> Hi Julia,
>
> I noticed that drivers/hwmon/gl518sm.c was not converted. Running your script
> on it does not do anything. Any idea what might cause that ?

I'll check.

> I noticed that I get a warning if I specify a debug file:
>
> File "devattr-new.cocci", line 36, characters 5-6:
> Warning 26: unused variable x.
>
> but that seems to have no impact and is always seen. I think it is caused
> by the following.

Yes, it has no impact.  You can change x << d.x; to _x << d.x;

>
> ...
>
> @script:ocaml@
> x << d.x;	<====
> show << o.show;
> store << o.store;
> @@
>
> if (not(show = "NULL") && Hashtbl.mem taken show) ||
>    (not(store = "NULL") && Hashtbl.mem taken store)
> then Coccilib.include_match false
> else (Hashtbl.add taken show (); Hashtbl.add taken store ())
>
> ...
>
> How does one specify indentation preferences ?

Actually, you are pretty much stuck with what Coccinelle provides you.
What do you want to adjust?  Currently, it shouldn't have any impact on
indentation if the new name is the same as the old one.  That function
could be generalized to allow length changes of up to a few characters, for
example, but I'm not sure that the result would always be satisfactory.
When I made the patch, I had to adjust about 5 cases by hand, where it was
sending all of the parameters past 80 characters, because the name of the
function was long.

> Also, how do I generate
> an actual patch (instead of getting the output on screen) ?
> Sorry for the maybe dumb questions ;-).

The patch is on standard output.  All other messages are on standard error.
You can also use the argument --in-place to change your code directly.

If you want to only work on the hwmon directory, but to get a patch that is
relative to the root directory, you can do:

--dir linux/drivers/hwmon --patch linux

That is, the argument to --patch is the directory that you want the patch
to be relative to.

julia

> Thanks,
> Guenter
>
> --
> To unsubscribe from this list: send the line "unsubscribe kernel-janitors" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
