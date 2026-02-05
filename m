Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D69AB35CB73
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Feb 2026 07:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770276371; cv=pass; b=MOmWArV2zdq271nDmfkGnVU8pMyFJbXOC/v1AtnOwPkQEakV8PyoII8CP9wiANqdoqk3JN8Bq6jEzx7J1zk5wuHzWw9YVIRZMjCmAz8UZaugFzML8lqLq5FXUXRDvqbdL98GeD3VlTCXVQS5Yn2drAmOwmnWw7BjZYD9ebijIdg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770276371; c=relaxed/simple;
	bh=chZKh7A+dwWXNFgyj26v5tyLr+o0hwC6/62AqhwxVbY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gByNYrR+XnT+qvfRIpBjddsrSWp3c3oaFehip08NaAmYKyt8JSNS99Ua1rUF5l1TxcCtr2tfaAa4HStHZWpvaI10dO9PSkxsIc8DbTFKRUBObFvnLMX7HW4lupwXMEAWfn6V7FSpBXVC0fwM+xJMAu8c1VZ0F9Xy541VcpTS7E8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gooddata.com; spf=pass smtp.mailfrom=gooddata.com; dkim=pass (1024-bit key) header.d=gooddata.com header.i=@gooddata.com header.b=Kam+OgNS; arc=pass smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gooddata.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gooddata.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=gooddata.com header.i=@gooddata.com header.b="Kam+OgNS"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-382fb535b73so5767061fa.0
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Feb 2026 23:26:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770276369; cv=none;
        d=google.com; s=arc-20240605;
        b=gVsQ9qnpw5in6l2ARH8erbWbv0plvcqzaLTHJwIeCxO0PlITDCI0LbQdRKy6khI1rw
         /AvGCZYqvAyT6LiBhSj5UM9sVCtfWHF1BzjKQHJdOzFs2ylQHEbPzRymM8gA8CNhKE1S
         zv8uG0KXpoRURfPPevnmlmeGFkDD5AW/cIuikj8Xg9TtR+dRoU0SzGnvIIp4BsHKZW5z
         prqocndRc/Uivy56/M9VNTDRRKz7COC6xAAumEEI9NBOVPI5s2IWYVGE+0brtTZbOJnH
         aqcvvqyio+hTQrV1d45YYkkRujWEVuKK01ObeEBYWrkQFwZRslxvsbWT5YbT7pQMecc/
         jVZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EabkhdlekNaIrQNqdNsBDJghU9qF/F10EyqKMiZd5os=;
        fh=ei4sD0BpIjDPzb66XvBYi1Yv810Hl8uZFi6cMyR4xGI=;
        b=IhCI0mAmzu6gqmdBVAsSwKOG98Dd3Zeft9qSZX9flxlgbNrF6LABOqKBnnGUv5iKzZ
         aBe0W5bALBlu5Y1yi/yMBR/Rn23B9RPHxuGF23qKgCsk+Lz/rb1zpweAUpkR8W4T0F+4
         e48uPO4XVnqIy2VDsBs5SbV8DPmu0hYiuhMU1kUopyettMfwVuEc4tQXf5jlMXsF+uLS
         5Eg74kxo5C+E8i4E8Q83XCcoXAR1xPCySyq5m2rFI4YcVy8g6qmohHzhLByOOsypqG9N
         KtlUIFS+Mp5R+Ju3+J9GaNjr4o7ym5ILkCKYeHqkgZE4FpCxpiW/iIx5u5k4SfY2YWAH
         zYXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gooddata.com; s=google; t=1770276369; x=1770881169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EabkhdlekNaIrQNqdNsBDJghU9qF/F10EyqKMiZd5os=;
        b=Kam+OgNSD4xgUZIfe7jcYF0AfD+/UXYDZmKDbbppG9rykBX6MjSyTMm5eKX0aPrxP3
         o+ggR7S/cyrNH/nyhMChx4ZZ87zI8kpKOCOnsJW4ph6/e7/m+E8kYW6u0UY2gDNW2RRe
         M57nsNfgpqBNHclA8ufafrWAMdA5GsfdTH6Jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770276369; x=1770881169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EabkhdlekNaIrQNqdNsBDJghU9qF/F10EyqKMiZd5os=;
        b=MozVmlRS5+GusiGhQOzR/l5sDHohyNoeg3RXLJBjU2xB8CiAb16492AXdLd/Cv47RT
         vh8ztz7rB16RrWIVeR8jzaVx+jUeztO4DFxijx8dZk1S25JtREJOhoPrdcfQOzh0ybcK
         J3HXeNIh47Eybua3294ACA+J7yVuUEsUjhD3Dgh8VTj+CtLEeu/iWp6xJvwBxeOovhtH
         w55f8GubZIB4gvL3tT5io5aw0VWd+6zrZE6vHttkjnpx3YIrePVCkUB+90vpRemcIFX2
         6IXidUDHNtPqVEu1/PXv43THLy/Wz7K6Xu63u5YeTlWmF6vPVc7CFxs+W5iZPBMONS9R
         smwg==
X-Forwarded-Encrypted: i=1; AJvYcCVKNPUT7oE6EFeXLPpwKXWcpzsJC0SuA0I73b2yhtc4GMFNHqp7bV3wieANnY6UfpihOVAO764hvYm22A==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD3H9YjPS99RoXX4Q9WJs/9kxb/FFF/o7omnWTJICtIDOdr/NQ
	xlqts2HxKm+kkyooFEz0PYdU2vXMtwnpEXBgDOuNi6bH+PkC7bb+8iVosMTmXc9LhZM/jV3/1je
	3GtKG3QdD+1r8KTArMcG9PwS0VgTqrI0u/XYD3va/
X-Gm-Gg: AZuq6aISlLr5la1oWmnsgYBU/4CVUxPPqOSqpNwQ7wsVk5um28h3NQkvSmyOhXBHIg1
	JQw+zCikSJ56ViObJRAtMADJQLAYXrTT0hi83JBCT8ID4aWsIfP310U25NL47sQKfva/V7jjXb2
	qqnZhoFBnBCED5GXBhDyyBl5BYGDsVsp9f3Jlyzp91cbdquz/4TWv7VjCF5oqeR2LgeudncYPjq
	biR4rg2PgAFdwXwqgWZzIF0wxwqTsLuN4EsuFkf85oKXagjojZkgazEp/gM9RWvtHSGBizp
X-Received: by 2002:a2e:a543:0:b0:37b:b849:31c3 with SMTP id
 38308e7fff4ca-38691e806bemr19213511fa.44.1770276368914; Wed, 04 Feb 2026
 23:26:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAK8fFZ58fidGUCHi5WFX0uoTPzveUUDzT=k=AAm4yWo3bAuCFg@mail.gmail.com>
 <CAK8fFZ4izdX_HDtGN60CZ3Ta61nqkUg7ncViM=mGgxKki_5FoQ@mail.gmail.com>
 <a7334568-13ce-4600-8650-607273e67976@roeck-us.net> <CAK8fFZ6gKs7s2rJ=f7bt24f+_cY-jGU33TvX3UP=U58uK-1KaQ@mail.gmail.com>
 <fff54ec8-496e-4c26-b652-358dc4de0de0@roeck-us.net> <CAK8fFZ4wEUdMAHkfdC_z8ohYB_rEXZ=dHArc75jDibgQ_-ozKw@mail.gmail.com>
 <4f151d4c-fdc6-4281-87b0-b7120eeb1b46@roeck-us.net> <CAK8fFZ401-nez_CgDTTnQiPT=oBRRJuYooXyEKFuCdHpGCPXtA@mail.gmail.com>
 <27d60756-d33e-4926-9a02-f52505339de6@roeck-us.net> <CAK8fFZ43wrQ8A_bO_g+rKN9O31sxULtqA0hUieZSzEH5KqeW1Q@mail.gmail.com>
 <CAJZ5v0hEu_io2BAzp9weUDHwHngorjZ37GRUK=ngSXNjtp38qw@mail.gmail.com>
 <CAK8fFZ65Vro5nQqJq_cvsY93hgDbfTdibWnNr5b0Bixzc-ESfg@mail.gmail.com>
 <CAK8fFZ6Vi4xayvdKh-_eLi-nDNMLuEoMsvwEnb33QqnwS7o4BA@mail.gmail.com>
 <1c8f748a-5c5d-4234-ae86-7bb12045a373@roeck-us.net> <CA+9S74i+BC3=E0opOPMff0cuC1OPYSecii0C8fVZ+NM7bptNcQ@mail.gmail.com>
 <fee01c19-2711-487e-91e9-d57f9be04b98@roeck-us.net>
In-Reply-To: <fee01c19-2711-487e-91e9-d57f9be04b98@roeck-us.net>
From: Igor Raits <igor@gooddata.com>
Date: Thu, 5 Feb 2026 08:25:57 +0100
X-Gm-Features: AZwV_QiwwcyEnfn_e-4mVVKJfsZWpooDgHk09kcus0RQYk-I2NY6LI7HM_zb4A0
Message-ID: <CA+9S74jR9jRRE-DNMxNg=6Uv2uDAUar2n-RkVDJqzkDfNu3eog@mail.gmail.com>
Subject: Re: [BISECTED]: acpi_power_meter: power*_average sysfs read hangs,
 mutex deadlock in hwmon_attr_show since v6.18.y
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	Daniel Secik <daniel.secik@gooddata.com>, Zdenek Pesek <zdenek.pesek@gooddata.com>, 
	Jiri Jurica <jiri.jurica@gooddata.com>, Huisong Li <lihuisong@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 4, 2026 at 11:49=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 2/4/26 11:54, Igor Raits wrote:
> > I have written a patch with the help of AI and it fixes the problem. At=
tached.
> >
>
> "No MIME, no links, no compression, no attachments.  Just plain text"

Sorry for that, I had assumed that attaching the file would make it in-line=
.

> ... which means I can not provide inline feedback, which is the whole
> point of the above.
>
> Your patch crosses subsystems, so it will need to be split in two
> (assuming the ACPI side is even needed). Also, references to iDRAC
> in common code seem inappropriate.

Yes, this I believe was the essential part (it was the last piece in
my testing which fixed the hanging):

diff --git a/drivers/acpi/acpi_ipmi.c b/drivers/acpi/acpi_ipmi.c
index 5fba4dab5d08..ab1f4b27741d 100644
--- a/drivers/acpi/acpi_ipmi.c
+++ b/drivers/acpi/acpi_ipmi.c
@@ -572,7 +572,18 @@ acpi_ipmi_space_handler(u32 function,
acpi_physical_address address,
                status =3D AE_ERROR;
                goto out_msg;
        }
-       wait_for_completion(&tx_msg->tx_complete);
+
+       /*
+        * Use a timeout to avoid blocking forever if the BMC is slow
+        * or non-responsive (e.g., during iDRAC reset). The timeout
+        * should be longer than IPMI_TIMEOUT to allow for retries.
+        */
+       if (!wait_for_completion_timeout(&tx_msg->tx_complete,
+                                        msecs_to_jiffies(IPMI_TIMEOUT * 3)=
)) {
+               dev_warn_once(ipmi_device->dev,
+                             "ACPI IPMI request timed out\n");
+               tx_msg->msg_done =3D ACPI_IPMI_TIMEOUT;
+       }

        acpi_format_ipmi_response(tx_msg, value);
        status =3D AE_OK;

> Thanks,
> Guenter
>
> > I don't know how correct it is, but it works :)
> >
> > On Wed, Feb 4, 2026 at 2:01=E2=80=AFAM Guenter Roeck <linux@roeck-us.ne=
t> wrote:
> >>
> >> On 2/3/26 15:21, Jaroslav Pulchart wrote:
> >>
> >>> ...
> >>> $ git bisect bad
> >>> bc3a9d217755f65c137f145600f23bf1d6c31ea9 is the first bad commit
> >>> commit bc3a9d217755f65c137f145600f23bf1d6c31ea9 (HEAD)
> >>> Author: Corey Minyard <corey@minyard.net>
> >>> Date:   Wed Aug 20 14:56:50 2025 -0500
> >>>
> >>>       ipmi:si: Gracefully handle if the BMC is non-functional
> >>>
> >>>       If the BMC is not functional, the driver goes into an error sta=
te and
> >>>       starts a 1 second timer.  When the timer times out, it will att=
empt a
> >>>       simple message.  If the BMC interacts correctly, the driver wil=
l start
> >>>       accepting messages again.  If not, it remains in error state.
> >>>
> >>>       If the driver goes into error state, all messages current and p=
ending
> >>>       will return with an error.
> >>>
> >>>       This should more gracefully handle when the BMC becomes non-ope=
rational,
> >>>       as opposed to trying each messages individually and failing the=
m.
> >>>
> >>>       Signed-off-by: Corey Minyard <corey@minyard.net>
> >>>
> >>>    drivers/char/ipmi/ipmi_si_intf.c | 29 +++++++++++++++++++++++-----=
-
> >>>    1 file changed, 23 insertions(+), 6 deletions(-)
> >>
> >> Now that is interesting. Does reverting that patch on top of 6.18.8
> >> (or any other 6.18 release) solve the problem ?
> >>
> >> Thanks,
> >> Guenter
> >>
> >
> >
>


--=20

Igor Raits | Sr. Technical Manager, Platform Delivery

igor@gooddata.com

+420 775 117 817


Moravske namesti 1007/14

602 00 Brno-Veveri, Czech Republic
