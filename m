Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8649D1DA20
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Jan 2024 08:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706345805; cv=none; b=Vxjw1CyKKKDTtdtx+LjYxGddXRJrqOr1m7986dxYq7koYyNSwouN7zZcqKRyf8zjQTPv6OjKF8XCZjsk7HD0t5obxGj4l9OIRIhfq2Cq3lFkuYtWJm9At2UJq/jxhmniII3XVfQOzp75ldDVHrtuuCIeAwERUY9KIH+eSzNPmbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706345805; c=relaxed/simple;
	bh=6PbkswORj7/lO4u9C3kRss/3Jn0QJMB+Xfk4KXF4b0c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SrTwtHsBoUmseijkvRwuY0/HzkeZljjYv32QV+1eotBQSjfFpubPXPMK0LeTzfA2/6/DBGG2y4CLh3p9d0xyzF/LdqgLLAhDeGGNRw7i8DKF508CJhtdIvr0hGJy5HcAuMahj5iGPSpT2q+GElEeechCWbP9tcKb0++NWVsr1wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=QKCNbg8l; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="QKCNbg8l"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dc223d20a29so1100242276.3
        for <linux-hwmon@vger.kernel.org>; Sat, 27 Jan 2024 00:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1706345802; x=1706950602; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=54Y5clqAOFbmhFJpHbhFLpVDYxvBPJjbvQt6nNmoiZc=;
        b=QKCNbg8l94fpU/QwiXu6rpjAH+eTMWzRozhpSWRExlx0iWybuDQ01AkthVz8UvpbGK
         OF0wWulYA3IKDlS8NmqyguW+sVRp1rbTTXkrYdtOPFC6bitAayKDy9qLoYyGJ8lL/07F
         UuxKLL0opVAmw5i32t2HkAbXgSgpAdWWl2RMZPWrhploOxISEXnOzE8Ezac6PoN5XO9e
         l0sCrAXuq6YuZ3ouKjOcDKBqUsBliNq/JoRjl7IRgw56GqtStzNCzjsiBMNEM5cCEkT0
         7zqFdBYLU7ji5H0xSu199/8BkRNK9YPXM/p9UYqGIZgC6JRQuq0Mz5GwQSTqsT+euMNI
         27cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706345802; x=1706950602;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=54Y5clqAOFbmhFJpHbhFLpVDYxvBPJjbvQt6nNmoiZc=;
        b=OKkPPwFlTwLqpgo7JWvzLeKpsDJvLbg5Fnxf3HaVw8Yeaivf8mF5gg6e1s8KuHN0ck
         3jsXHtJwVsdrrTB3tV9N7WlOCldKQ656LOfxyJaBbvvCZ7VYqrydPx7k+fgD9MZeLw9Q
         T6WkqTrx99Ba3ni2Bt48c+UQldoXnNDUDnv7BdVzvrVIQbbuNtSQd+oHPX2p4hR0d+mJ
         AJPUQ+ZbXI+rqJ428wccbOHbrd/n3qLvqWhsHiMw1F296GBuR+KkhERXnW26av6yDMUa
         Cf9fIbO0p0RUeGYFNqQB8vT8MENGpeH/l/onpaAvwfJ4lwoNr7U+mw5ixVOrH0eMD+or
         zULA==
X-Gm-Message-State: AOJu0Yx/96VsCQyX9dGtcYFjc5Cn9T7sebfJP9OLydgIs1IjRqvFX91i
	Zta6jvBnzx38bPJUY4h8tu7xbz3T7PUtjLpP+u3CHsiaU5nx4xW1X3wtvdgxegBKEIBVusZM3V9
	BcvEhIEbovzgJHRafvhBrAbbA5xir9JIjR1sPuw==
X-Google-Smtp-Source: AGHT+IFgU61HHls57s6zMpbxJHVMRFb1SocHCcyN1ZNJqI3BER7XSkSccfXkdzAP/orWwFRBeUWCaF/ev3fhZVoE00g=
X-Received: by 2002:a05:6902:148:b0:dc2:3ae4:2180 with SMTP id
 p8-20020a056902014800b00dc23ae42180mr1201924ybh.129.1706345802524; Sat, 27
 Jan 2024 00:56:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240126205714.2363-1-aladyshev22@gmail.com>
In-Reply-To: <20240126205714.2363-1-aladyshev22@gmail.com>
From: Patrick Rudolph <patrick.rudolph@9elements.com>
Date: Sat, 27 Jan 2024 09:56:31 +0100
Message-ID: <CALNFmy2KVbiwvuEz=qjcB1vL82OOPSsZMuYWze56siCHLQ8JgQ@mail.gmail.com>
Subject: Re: [PATCH v3] hwmon: (pmbus/mp2975) Fix driver initialization for
 MP2975 device
To: Konstantin Aladyshev <aladyshev22@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, 
	Naresh Solanki <Naresh.Solanki@9elements.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Konstantin,
Thank you for fixing this regression.

The comment is no longer true as the driver doesn't internally convert
from VID to direct,
but rather configures READ_VOUT using MFR_DC_LOOP_CTRL.

The comment thus should read as the following:

Report direct format as configured by MFR_DC_LOOP_CTRL.
Unlike on MP2971/MP2973 the reported VOUT_MODE isn't automatically
internally updated,
but always reads as PB_VOUT_MODE_VID.

Regards,
Patrick
On Fri, Jan 26, 2024 at 9:59=E2=80=AFPM Konstantin Aladyshev
<aladyshev22@gmail.com> wrote:
>
> The commit 1feb31e810b0 ("hwmon: (pmbus/mp2975) Simplify VOUT code")
> has introduced a bug that makes it impossible to initialize MP2975
> device:
> """
> mp2975 5-0020: Failed to identify chip capabilities
> i2c i2c-5: new_device: Instantiated device mp2975 at 0x20
> i2c i2c-5: delete_device: Deleting device mp2975 at 0x20
> """
> Since the 'read_byte_data' function was removed from the
> 'pmbus_driver_info ' structure the driver no longer reports correctly
> that VOUT mode is direct. Therefore 'pmbus_identify_common' fails
> with error, making it impossible to initialize the device.
>
> Restore 'read_byte_data' function to fix the issue.
>
> Tested:
> - before: it is not possible to initialize MP2975 device with the
> 'mp2975' driver,
> - after: 'mp2975' correctly initializes MP2975 device and all sensor
> data is correct.
>
> Fixes: 1feb31e810b0 ("hwmon: (pmbus/mp2975) Simplify VOUT code")
>
> Signed-off-by: Konstantin Aladyshev <aladyshev22@gmail.com>
> ---
> Changes in v3:
>  - Drop accidentally added file from patch
>
> Changes in v2:
>  - Fix indentation issues
>
>  drivers/hwmon/pmbus/mp2975.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/hwmon/pmbus/mp2975.c b/drivers/hwmon/pmbus/mp2975.c
> index b9bb469e2d8f..5bbfdacb61a7 100644
> --- a/drivers/hwmon/pmbus/mp2975.c
> +++ b/drivers/hwmon/pmbus/mp2975.c
> @@ -126,6 +126,22 @@ static const struct regulator_desc __maybe_unused mp=
2975_reg_desc[] =3D {
>
>  #define to_mp2975_data(x)  container_of(x, struct mp2975_data, info)
>
> +static int mp2975_read_byte_data(struct i2c_client *client, int page, in=
t reg)
> +{
> +       switch (reg) {
> +       case PMBUS_VOUT_MODE:
> +               /*
> +                * Enforce VOUT direct format, since device allows to set=
 the
> +                * different formats for the different rails. Conversion =
from
> +                * VID to direct provided by driver internally, in case i=
t is
> +                * necessary.
> +                */
> +               return PB_VOUT_MODE_DIRECT;
> +       default:
> +               return -ENODATA;
> +       }
> +}
> +
>  static int
>  mp2975_read_word_helper(struct i2c_client *client, int page, int phase, =
u8 reg,
>                         u16 mask)
> @@ -869,6 +885,7 @@ static struct pmbus_driver_info mp2975_info =3D {
>                 PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT=
 |
>                 PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_HAVE_POU=
T |
>                 PMBUS_HAVE_PIN | PMBUS_HAVE_STATUS_INPUT | PMBUS_PHASE_VI=
RTUAL,
> +       .read_byte_data =3D mp2975_read_byte_data,
>         .read_word_data =3D mp2975_read_word_data,
>  #if IS_ENABLED(CONFIG_SENSORS_MP2975_REGULATOR)
>         .num_regulators =3D 1,
> --
> 2.34.1
>
