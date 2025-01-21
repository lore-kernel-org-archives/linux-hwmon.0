Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE77520328;
	Tue, 21 Jan 2025 01:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737422349; cv=none; b=G14jlL1gPjwh3xsE4b9RujTLj3vVQkPjWvsSduYdeQ1vBaWlPti/tNhQkpdYwe3K+IMsktn+NB/hthXXtPx2Vz3WKiu9izsmq9aX5YXy8i0O1DRqa9qQ7rXS5WICOgKdW8ErGLlcEtm0wkLXOdpOX8ndeCYFUUZO8ov5cYdrPoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737422349; c=relaxed/simple;
	bh=uk3Z7P+ZQ3E1V90Ie19ZUO0ERwnbBKgORJX63Abnxr0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HfLf+qlzTalovexibsDpGbIl3H3mvtxXkybEVuprQbMBBran7h0gFjPErTyUC1Xv/VpLbu5xe2GKA8o78H0ZsJXuYyQKf+g0H3JfF0jbBAMQXFbNgBb4tgeifJbNNRrcTZmN4lRGvqdxLcfTpjxspSFROrQr3jwm437mHiGzcv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FXDj5Jh6; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FXDj5Jh6"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aa6a92f863cso946093266b.1;
        Mon, 20 Jan 2025 17:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737422346; x=1738027146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uk3Z7P+ZQ3E1V90Ie19ZUO0ERwnbBKgORJX63Abnxr0=;
        b=FXDj5Jh6bD8bq6UNrMlZ1dgH7PUkjAcd1daeiJQjBcHvpDnpN56mchXxR52CHsz2RW
         C4YNBedkIck02KBHQiWrLvQJrZXZFMMNxBdO9FixcqTBo2RK/vhJkFOXG3UcrvBgJ2oH
         rb95RpbNEcupmBF289Fu/BJXyZJOce08gwIdEzA2ZpSRdoFVUmSUxS/l5fD1HEsN3tMk
         AVXEfvHn9d/Tsn6khF816teaf5Xv0BVNCvgPkbOgm6ZOiFvyzVYKYqERdoiaOTa1ECqi
         pns8+dRObX2fD7jal2Q9JsSgBl0KpeWFtxwjCVUPCq4KVETRdtoYiMJP1pPtwWYCoBVE
         bUAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737422346; x=1738027146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uk3Z7P+ZQ3E1V90Ie19ZUO0ERwnbBKgORJX63Abnxr0=;
        b=EQyEsCBhbgSck0TF9pmPZfElVZlUpYnIxvoCpGBtAk07TDy1HlUeVzzb/ap5AG6Qlq
         l3Q2x5Qg30M6fUdDzlYo1aq+KzLQ3mGGEcg893LulkGhznRjIUS3AS7EFfGcZDSGBHr0
         YnXcG1SD8PXXYTlCbJBBDawNl88yMYsDhj7q+292DvjWzsc69VTs9DmlfAyJK4zxRp3Q
         xxRW90rCYZ0ow8iBG1kJUT5wKYQ2I0QVLpLu3JBl+VN20NDA7GVR6pQ8vjbWtn95TF3A
         Hm32FkncAmY5Tajqrty+q81d9kNKN5ql3GuxoJTK15wNpmmWrYug4haG67PaQw9mJroB
         OIFg==
X-Forwarded-Encrypted: i=1; AJvYcCWNV9CL5+kRAcaW6q1C54VOBJpFrbwpAgfXkOoHvBD2M54QMsa8jcRxTiHOWsFsl6Z6TVTp10m9hQqeIykn@vger.kernel.org, AJvYcCX2enIca6XkyTsQdD7qXWFXihyJyN6o9TywlNZNkVPqKgtDs5Nv016uf5zov213/gAhR6ibz8c1FRC1rg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXwFTFxv+Z4+coPn0KtEo1+FN5KQfFImLffBpkT22uEzR7zLgU
	nSFb5dzGhdOcdHd2+Ir/0CKZqbw3Mh2M2kMmXim5iqCBG1Y/LQ80ZzaATmiyns1jL1e0OkpnJ5v
	C99sQccrhprmTcYKVNWgzI4ZHk8s=
X-Gm-Gg: ASbGncvUIOLXyr7N57/IFq8/Gi82lmOUDUVwjTaaB3dGIgJOG1XY+Va3c+ZWUyF+BiQ
	D8EwCxJkKAEBy2yBT4Y6q/Rg0pyWMYVS9spI5zD9e7jWX5Z+P3d/w
X-Google-Smtp-Source: AGHT+IFLnedijQ/hxmcpbbdeTUnqggpFBjWFKPIaA6IFyD3CfETaKILgVlBl6RNMrQaSo0KFFORN/TZ0mISWJeIeiXI=
X-Received: by 2002:a17:907:1c24:b0:ab3:4c36:7d31 with SMTP id
 a640c23a62f3a-ab38b24bf02mr1233963266b.22.1737422345690; Mon, 20 Jan 2025
 17:19:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250121-potin-ina238-shunt-voltage-scaling-v1-1-36d5dfe027f5@gmail.com>
 <ef0741d5-832e-4c15-ae45-f4efcf4bc443@roeck-us.net>
In-Reply-To: <ef0741d5-832e-4c15-ae45-f4efcf4bc443@roeck-us.net>
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Tue, 21 Jan 2025 09:18:54 +0800
X-Gm-Features: AbW1kvZa7blNZ1LibGhXptYReXolJnufVQZDYefuK8jgHHCrS6JmZAhG3QdXxJI
Message-ID: <CAGfYmwX2fEPmLbc2rP=R10WaV_LpX-_uy+SZnJ+gYg3bnO_Yag@mail.gmail.com>
Subject: Re: [PATCH] hwmon: ina238: Add support for shunt voltage scaling
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, Patrick Williams <patrick@stwcx.xyz>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Cosmo Chou <cosmo.chou@quantatw.com>, 
	Potin Lai <potin.lai@quantatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 21, 2025 at 12:38=E2=80=AFAM Guenter Roeck <linux@roeck-us.net>=
 wrote:
>
> On 1/20/25 08:23, Potin Lai wrote:
> > The INA238 sensor reports shunt voltage with microvolt precision.
> > However, the hwmon driver currently exposes this value only in
> > millivolts via `in0_input`, which results in a loss of precision for
> > readings within the range of =C2=B11 mV.
> >
> > This patch introduces an `in0_scale` attribute to provide the scaling
> > factor applied to the shunt voltage reading. By exposing this attribute=
,
> > users can accurately interpret the in0_input values in microvolts,
> > preserving the sensor's full precision.
> >
> > Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
>
> Sorry, this is an ABI violation and thus a no-go. in0_input is and will
> always be reported in mV.
>
> Guenter
>

Hi Guenter,
In our use case, the shunt voltage is less than 1 mv most of the time.
I would like to get your advice on the correct way of getting
microvolt reading from the driver? Thank you.

Best regards,
Potin
