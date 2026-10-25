Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792969994;
	b=IDHX0ID2LoC5eGIa05W2zgCLpxnqXMKBcW46vRlOhAcV1riyk5T5C6dBOhIENIUXGm37
	 OhUtFt3GM4XjD4DMW8fy73KLiNNmK9PZSSmIsOIAY2cLoK9eJ5WequCw39ovBvY7u189T
	 n+YrVTVEhEcxiDnx9vy3iSXcGcIK7JhQcsbSfWJl68tPF+2NTRGl7iFOL3QvUVsbz/fRq
	 Q7+ikO9XuMbCsEPM8uRPm3L1Y5deYyYf0ely7n/23eugaTx7e6y51KWU8QPHKU6luY2lZ
	 dlesKbYVLoHVvtftwDNxx1WHhA2qdckyackWJQp+DLPM4DgV2wCkwOYPgyp3D6Ab/qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792969994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To;
	bh=mR+Son9tYd2EdXF7tinsIzW0uhxqVUc0z3Q/mgmDfNw=;
	b=nQpz5IUPwr3XC2ihFVGPOoJx0n5oGOFrGAWanhPiEZLFzuWaMUAiVUrxFSy70C1C+6Zu
	 2qiTqeOwP4usjjuKl5pnNpEvDSUE6c/Oi3ql5JreABKvnKWJk1VvAfHKLARngiLtLUMJi
	 +yPniZc5JVA0iehCPV5Ivm+bMEhQzBA0HVzm3tCBU0Cc2OdQOpjN/Zc60w02KexCMY5tm
	 +YyE1FJuOoyX4195IbRyj7YpsVaiHoiiDrvkQADtOyP4dLqtwNNr4Er9hGeuk1O+4vubH
	 T5BnMeAPTkC+e8oaGY1iKSfp4+jPw+g0w9wqMrdn+y4iVqlm+m1dWCa/NX7q5Iylhbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=SyVKvHEs;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 953CD606A31B
	for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 23:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 953CD606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=SyVKvHEs
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-35f1f76ea84so4122936eec.1
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 16:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792969993; x=1793574793; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mR+Son9tYd2EdXF7tinsIzW0uhxqVUc0z3Q/mgmDfNw=;
        b=SyVKvHEslJ/Z9K8YJ22TGO9uybiX03BNspUhbcdvAnGMGT3+QRPFAnZqIihcY+kCAH
         InhNLrwJmZyuJAoIDWsbk5Q0AxkpQJdrD+7LU/P4SZcQftBiHoxcLdFPsz7E2Fyxaoqf
         NUOHVCrjLyDSjN0iKLJJO4dLzwzVv7HRIxXRe9UWO2GoUlwvjgaVzFApn0zw2S5hizKe
         iwoHJgRuRRP2j/IGWpGBDMj0cYNVyTNdeqIttxAmUwh9VbJCiIqB//0Jn1fCCd4btdZS
         RdGG7lJgUJ8zSXJoWqLRSK7q3EXOQfO6oqzCDzaZ3KAJjL6O0NaFbZL92RNRsflze7Bs
         irPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792969993; x=1793574793;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mR+Son9tYd2EdXF7tinsIzW0uhxqVUc0z3Q/mgmDfNw=;
        b=fNn/jzPVC6kRZSAsRSAXWHlnKpBa0LObAO9pLdyluaFduqcEp7LiBrUk0XWpLkywnL
         G+g7gTQ7z6YOqtsk0bxqvfnVMS7lEYRSIrA/hHYeIFMbkGdCnTo4Thr5A8J57GyQnGJR
         yYqV02ulyfOPR7RlOBaVzRZltCFka3IwgevrNVSdQx5YVOzEf+5IIgkBUPoR5/SrvanT
         fdZxYae4ZabgBk1zf5uVGysLtER2osMGNm0o+SvLsoq9d/58+wD4INo43IRmaPEQKO8x
         01BSTmvHWkG03CcpUDdg+vmiN3gKCtZ6YT14ewhE2HI9Eo//jj8EDEaKo4a/oq9hLMi5
         47WA==
X-Gm-Message-State: AFq9FYKKFcXQoEhWBM9M6ygleI04t8UFwOAwNjrJyFy+Mj+zBDhnSOJT
	1wKb9JhDmgawNQC/fp0omD8t5MpKyUCN4bjzXr/q0V/TWaExiVm+cORTQ51gms18ADs=
X-Gm-Gg: AYBFou1D9uWAtJaQADIcmgQ/0nzGAGP+bgtnawD9R3RVLnuuNabBBU+v/YewEhOl/Wk
	8j/9viYjxcOK7Vx2i8cu8LKOYIm8bc139q8/XLOlyy8BplIhH8e9LU/LNewRGkJL0L5wLyeeCEO
	82ST87y++nvKyQR2d6ts8WLfteUNu5U39J0xwjJmQ8wiMLprb+8UYVLhkNZ1ueSxkz3fF5Myr39
	c8vELxyu4Ziv9y2uh4cs+mVX3u7D7dKyXbBj2nPQ9SdE4Pro5oUQdDTEGM6ojt2mKXnbPnyebt0
	xjDyA0Eq980x5wQur6Swp9T7yu//OqX81h0llxwnj0I8D0/US9rVr358TPCN3iL4x27YRKjhsuO
	no+0biGUb7v1gr77+cJwepiyIOe+UrfP8/UMJ123TZBTfX06oO1/6XKa9UT6rB1xuu/V/MQ7579
	9s4jsCf1hjJvSH39pNyZDilk8pPt3tXvsVv4rUVVOGFneK9pXBeivxhyu+7VcAO7M45UGn4d26X
	kqK7PzzMR6jLjxlYWz7jkQeuCbWI+jHdqPL6mLDl/MXFkPuniUke8uUNseg5DCub/zf90WGnscp
	qA==
X-Received: by 2002:a05:7022:7f12:b0:195:1a77:85cb with SMTP id a92af1059eb24-199290fe446mr7025882c88.1.1792969992473;
        Sun, 25 Oct 2026 16:13:12 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8d8a690sm19545470eec.12.2026.10.25.16.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 16:13:11 -0700 (PDT)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 Oct 2026 16:13:10 -0700
Message-Id: <DMEATES0KH0K.3C7G7F2FELPOS@nexthop.ai>
Cc: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 10/31] hwmon: (pmbus/d1u74t) use 4-argument
 i2c_smbus_read_block_data()
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Dmitry Torokhov" <dmitry.torokhov@gmail.com>, "Guenter Roeck"
 <linux@roeck-us.net>, "Cosmo Chou" <cosmo.chou@quantatw.com>, "Andy Chung"
 <andy.chung@amd.com>, "Ninad Palsule" <ninad@linux.ibm.com>, "Abdurrahman
 Hussain" <abdurrahman@nexthop.ai>, "Robert Marko"
 <robert.marko@sartura.hr>, "Delphine CC Chiu"
 <Delphine_CC_Chiu@Wiwynn.com>, "Daniel Nilsson" <daniel.nilsson@flex.com>
X-Mailer: aerc 0.22.0
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com> <20261024-hwmon-i2c-smbus-read-block-data-v1-10-e81941ad0cd3@gmail.com>
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-10-e81941ad0cd3@gmail.com>

On Sat Oct 24, 2026 at 8:06 PM PDT, Dmitry Torokhov wrote:
> Pass sizeof(buf) - 1 to i2c_smbus_read_block_data() and shrink the
> temporary buffer to I2C_SMBUS_BLOCK_MAX + 1 since only a single NUL
> terminator byte is needed.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/hwmon/pmbus/d1u74t.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/hwmon/pmbus/d1u74t.c b/drivers/hwmon/pmbus/d1u74t.c
> index 752df3af9c1a..758464a6362d 100644
> --- a/drivers/hwmon/pmbus/d1u74t.c
> +++ b/drivers/hwmon/pmbus/d1u74t.c
> @@ -30,11 +30,12 @@ static struct pmbus_driver_info d1u74t_info =3D {
>
>  static int d1u74t_probe(struct i2c_client *client)
>  {
> -	char buf[I2C_SMBUS_BLOCK_MAX + 2] =3D { 0 };
> +	char buf[I2C_SMBUS_BLOCK_MAX + 1] =3D { 0 };
>  	struct device *dev =3D &client->dev;
>  	int rc;
>
> -	rc =3D i2c_smbus_read_block_data(client, PMBUS_MFR_ID, buf);
> +	rc =3D i2c_smbus_read_block_data(client, PMBUS_MFR_ID,
> +				       sizeof(buf) - 1, buf);
>  	if (rc < 0)
>  		return dev_err_probe(dev, rc, "Failed to read PMBUS_MFR_ID\n");
>
> @@ -45,7 +46,8 @@ static int d1u74t_probe(struct i2c_client *client)
>  				     buf);
>  	}
>
> -	rc =3D i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL, buf);
> +	rc =3D i2c_smbus_read_block_data(client, PMBUS_MFR_MODEL,
> +				       sizeof(buf) - 1, buf);
>  	if (rc < 0)
>  		return dev_err_probe(dev, rc,
>  				     "Failed to read PMBUS_MFR_MODEL\n");

Reviewed-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
