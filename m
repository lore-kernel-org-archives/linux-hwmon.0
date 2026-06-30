Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4300D40D587
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 00:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782778407; cv=none; b=hU2a3FKRkHQSQNpbgu6bRwMucG6mq8gibU4mp7gyJAfz1IOr5rHy2xo7rPnEoonmSJI7b2FoEjyilmS3f3VSsLBe7NBwzluaidlIu8RIfLwUoPAkH4Pfs3lb7CxNTbSnwRHzjs75ik9LHcv9rC6lCIwsVxVvLS+kzl5SDmR4Kn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782778407; c=relaxed/simple;
	bh=YzT6k0EGsst81hJuYFKjei7Dd3McRdeNasg42zktoT4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X4GQfyDZzgbx5w8oj40MMHY2AVmGzixoZv//IF+JWPYB8hxMbg+EMgpXOBMte20+6LkaEkiIv5CY/lcMCw+EsMeqyyeUQ/hzD1lyHI4sqSQI2SkK7vsIU9dKKQwp3McSyZ4n1OqF2CHRu9oK2lWaI1TIWrPU1Q7KdLzq1vqEa1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VBZX1ppd; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VBZX1ppd"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4938d5f86f3so337355e9.1
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 17:13:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782778405; x=1783383205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YzT6k0EGsst81hJuYFKjei7Dd3McRdeNasg42zktoT4=;
        b=VBZX1ppdv1Ch/ePVpn7n5kNNoV11fHwxBiIONMkZIpExZTIwcziaxr2qW/rWiZJd+5
         ImqUhRBxhLY6mfx3nxdG7JpLFhpPJ/hnOJ1BcCddLnx/J/S4wMwp1zlkPY/fQvEzeME4
         fB7HGSJKskBQYwNWqgUwahQp4czV5xd2uyP7EDV4/MkFUpouDxwsMYhXM+jGE89hlU4X
         2uHlsGi2ElLPMzyP24jogZXU/9/V8rd5iVkghd27DKPZA+G/jxEyFj+Cs6cje3mGSdJD
         aequTOK9d0obhsrbaWrrEYEhAfnur8ClLYBZQy1509a2+M9FJNdfXg0qB+kVT26l8DqQ
         QJkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782778405; x=1783383205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YzT6k0EGsst81hJuYFKjei7Dd3McRdeNasg42zktoT4=;
        b=RrZVBN7zn9dmsYjrKkTDPcIcRt2KXjgZTa2V0KaJcgkOZX1cwV3XIbIol92SPknmbn
         taF4icrFcWgpdk1WpxKXYEfBGRt2HQpBpDTYb7MKtAo8KfQf1VRtSfEIKSEVGsqMrLvp
         qe+4rH8xFaLOWq8jo32KER2BahIsHUWVfo8lAY/sWVtc5dyxLAyFB1j3sNpvgy1x4YYi
         UWu4+fWkbXqp+z+PcZTi/in3+YGy6m9+U7qnc4P2cTo9CepL7aF4A9tLK6O0gy9LWNw/
         fl6u+z6zzF6iRsofuhW6eFmRqgCV+fUFRaT/MijvAr6PlXOR9WvR9PndSV27d2+jojAQ
         4FmQ==
X-Forwarded-Encrypted: i=1; AFNElJ9UXlXdsnxUnVKhsfx78bSZPZijamtWxPpl/QJDoQm2kv2ip/EZ166hyx6wuZsAbkK15o7J9raAo7vAJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBEd1Z6PI7+mkflbQ4eS0khu+SbnCIOKXc2DA+g409D+WBvW4v
	AVcbcTENGkQUf+j+lMZhGrXF/pC2/FUOsbu/pUYBoIekafnAGBke7JrZ
X-Gm-Gg: AfdE7cmDJVl9StrDyWLBlKovy1XocCtNnFC7x1ZXEA4AogG/zy+oRyfZqEP3qydqwY0
	whqoe7boOhv1ZmqTnHSU100vZR6FfAjvShfUt787xQ2sGZcVWoP8MHfFo0L9RebOED6aAZ7RYVC
	Zqi35tTMaUYQWWjZXqs2u+pRP7gABxHeiRsoDnvK7dERoRcRkNJ/zqnZA9AGskOTuEc23x47TX5
	oenHFD+eV2XuV7Lia7Ru8wPz8y56MXsAuOPC7INUb/VoosxWLOdsV5OaYDyjkKZDPqacmVf7uwz
	oXEkAo9/bsyj7JORi/HlUK1RLPJF/fRO7QxI8D5HGl7+lvrSkNsGy/JVtteOB/agdsPdGIFoVA8
	q58ZD2cTXpJz4Y9Ds/4Y0WKRmdi8K0KqXAn71dcUO31UtGMjivO8vMbQimlSLliUYtqTmhhjL
X-Received: by 2002:a05:600c:3485:b0:490:af63:2cb1 with SMTP id 5b1f17b1804b1-493b8d1bd68mr13488525e9.7.1782778404375;
        Mon, 29 Jun 2026 17:13:24 -0700 (PDT)
Received: from localhost ([2603:c027:c000:3cde::f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493b8ccc7casm25222505e9.1.2026.06.29.17.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 17:13:23 -0700 (PDT)
Date: Tue, 30 Jun 2026 02:13:22 +0200
From: Louis Sautier <sautier.louis@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Sathya Prakash <sathya.prakash@broadcom.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
	Ranjan Kumar <ranjan.kumar@broadcom.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Guenter Roeck <linux@roeck-us.net>,
	MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 RESEND 2/2] scsi: mpt3sas: add hwmon support
Message-ID: <akMKIk8JN8REuYVB@localhost>
References: <20260609164423.2829699-1-sautier.louis@gmail.com>
 <20260609164423.2829699-3-sautier.louis@gmail.com>
 <93542109-2101-4d62-aae4-bbf058029663@kernel.org>
 <airk3Os03wPV0rvW@localhost>
 <fdea1a8b-d631-43d8-bcf0-1c79e635782c@kernel.org>
 <ajkaf0aa0TWXdRZW@localhost>
 <841e8ff7-12db-4ca4-aaa5-fb8accfc9df0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <841e8ff7-12db-4ca4-aaa5-fb8accfc9df0@kernel.org>

On Mon, 22 Jun 2026 20:28:48 +0900, Damien Le Moal wrote:
> I saw only patch 1/2... I was waiting for the new version of the full series.

Hi again Damien,

The whole series is there, including 2/2. I sent it all on June 13:
https://lore.kernel.org/linux-hwmon/20260613023833.3163507-3-sautier.louis@gmail.com/
