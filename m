Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29FE13A5455
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Apr 2026 08:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775722746; cv=pass; b=uObh5euF5qctUiXxgbduYf1vm5703pAdNc18uA5nAo5x7oHTbEnXZecmlCH9ACawByx32Zv2REOsdEU6ZPUFZERfGbLcpMhN3NK9pbCMFZt9vA13jg7mPWwrUA4M2+yS2MAu7UDwG3DzSj0JERcjV2KEBKVsNjHRpMVTHE58j6o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775722746; c=relaxed/simple;
	bh=GtUkGmQN4EL5h2rkR5WgfM1JZC8AEtqZRGbgJ5anoLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ARjkclxSTj1jTNobp1wgVf/x/5hNJMcGkK+bYyU87Uh1CGc7h/zdHkfG3lrUxdFP3oJG0ICp383LXh3YUgEQ5L9679YgyadHYa5arWB61Wg3NCpl7mqH6StRUW3Hoem9vXWYORjz1NnlrIUruZdY8SwdYTugxeA/4XYLQ1+JIHY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aNuxb3OW; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aNuxb3OW"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35da9692ec3so736404a91.1
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Apr 2026 01:19:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775722744; cv=none;
        d=google.com; s=arc-20240605;
        b=M564ite9dGlRZr7B0b1r6HcMWNXQPSSbvcIMaoaeRWS9IyrCRDcPbrJqu9XmL5DCA4
         B/c4LZLX0PQqKcLnYKlLz6gyq96ZnH0BJNpp9Mvcl8Daayy2oeEJlkijwl6Yr4wk6t9O
         61JLcrfy+eiKSiycrtKDT5pz9hbOwuV38z56yjIeoYg8DTN4aFfP8thQ1/4TBNd/B2Y1
         VoO+S4vPq+na3hZFIw/PtTy+Nfv39Jr0pimBIKHKjDzbZKb1343ZqUIcoyO0bDNQn/5r
         4cmO+A4G7Ntz4xt6opf22QVpRkRms2DA4PzWLAyd7t9AsOAbpv1Xi1UlbAthPgEy+Y7n
         XSAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HxaRZLSN39qvxIV0ix/Q0XZyFLIVhPcJo8ZKpZblht0=;
        fh=mMRifPFwoem7HWMefPAoq7JhDFoC+1Yv/s5Exjwpths=;
        b=d4PI2qB3gRNns832ufoLPvDPsc6bP7kygAoWa2KmGkYBgBIWFR5B42UDlTecCcgqq+
         0rvhOKcB5Yl5dR/fEWv/ntjMDPVUgS018DeOEKbrl0mx0KUGG8kfNaJIgpQPbLzUxc8P
         igLUUzTl8xPDv6alU1nc6gzEtabNYEvGI9oIgs6QK49aZwCQRAOQJLA83APLkm64dUgF
         LR+mEozl0XOOgPF3Re4oJHyrta/PtX/lRBR2lApR2lUg4o5qJyqBn2bCcJYxS1o0kxY5
         V6se6hvd8/x502CLOhSi7xk0ZYfeC21gdsrmE3okgt4Ltw3DtIplfmGYyxgW5JOvm+8U
         uPxQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775722744; x=1776327544; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HxaRZLSN39qvxIV0ix/Q0XZyFLIVhPcJo8ZKpZblht0=;
        b=aNuxb3OWSm7AxwAOpoY0MjpWL6+TIljVkCAHFMqeFKtn/gLMrWkV5+yp4E6aVf9eKo
         MyTeEdMavTgFAtEvhi1/eniuOfjiLxi8DKrwIRu+qkcluB11uxTLZAgCJurRkrql33CR
         GW7dnKGgKWDh51izTBxr7cuURIkoEdXnLRwInI+0x55FseYKoo37nZz9kHGPe3AM6Q1I
         XkenLNdBWLSEYhKC9wzc1DaCyVbL2hfhYnq9cOcynx8Cx1UscPI9HX35Ik7TdoBmlQpG
         1VAoTiIQlmc/TDa53a5o2PDFB66mNSJUFSkJ+9XdxrfbGsKf8471oDEwaIxPzMN8o0fm
         nfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775722744; x=1776327544;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HxaRZLSN39qvxIV0ix/Q0XZyFLIVhPcJo8ZKpZblht0=;
        b=gfFQHWIDq9xE+YDdEOSCgl5NyFLSY6IoDO9AOrShF3fIoVgQCmxnWuNiBgOSDzxlhX
         CPlEqa+wfNYm6b4gFaxIIYHnSylChHVdkTAqQDgQ28+Mvejcd4dZCbZW9fAk5YkJEV25
         Juzoou5ehzn7F6adpkzjD/PupNrSQOwEFFBJGCFX7JfSMw2V/Lzfe4ytFJkM48IubLW0
         Iza4nhbUKboSyZBRK6htXlijRu5zBsTCq0BhrT2DGtRyo7jVMIGs6Lk+P54WYVKi0Gqs
         pMMvOLFwfP0JuDSOMEzEBxDeCf/3mmKJ+wrlQNJzTZE46Uy2wSmK2Se9iq4fWlseLrgS
         N/fw==
X-Forwarded-Encrypted: i=1; AJvYcCUOhunyM4ykNQISTis+KuefXo0LZSj22F0fn4RX7zqWWDunznXDzEBFxoKd0feN5+iF3KgcBjdJzVn14g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/dnkgtJZqAKCJXrrV/3oi2DYYpUAac/eojh1W6/oNlfRj4lLU
	UMeKtI0gmsiKNbN2c3CLUHDXs6iIcWWJ8eOJobni+qZEsFh83Hd9XRqS9NgBtv+OzMcSsrDtHNg
	O37XnV+XmGHbL5jJrX01lMKn5KbYY5pKP1dRtrTA=
X-Gm-Gg: AeBDiethb0SQToiWva7S75bvMEH4evbaCfiGtM07ur5erPeWF54SwT1DyP99VkaasWK
	ly3osCP/kMScrB2X4tSz8msziX/aejnVg7kGPkGbGRSvPWhLAi3EFWqE7ph2hK2QyZkeIa0/B5B
	KdEfMtfLTAlO+qmu5Y0UBmSMVEui85VghLViVe+Pw/2dobGAvUlHkgVnNOn+eBep/26lOBMaAPP
	FnGFe532uqbZzLVbGxtqytxYGtPOdevn2nq9OpUKWSQRju6wbIz7Jv5QTSmWTKTq5XQNqiOmugY
	8YUa+gSP9XehL6CUNFZ/eRiohB6VfgUi5R/QkfMM
X-Received: by 2002:a17:90b:5583:b0:35d:95eb:87a1 with SMTP id
 98e67ed59e1d1-35de67daa63mr23825380a91.3.1775722744531; Thu, 09 Apr 2026
 01:19:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403210343.1380437-1-eugene.shalygin@gmail.com>
 <05e9870a-5d8c-410d-99ed-6ef9470b2ff7@roeck-us.net> <CAB95QATxrJa0koMq=BCjnXvLHJ5boRBUA+76FwqWJhmhEi-Tqg@mail.gmail.com>
 <25bbdd98-656e-407a-ada7-da2bdacb1aea@rxtx.cx>
In-Reply-To: <25bbdd98-656e-407a-ada7-da2bdacb1aea@rxtx.cx>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Thu, 9 Apr 2026 10:18:51 +0200
X-Gm-Features: AQROBzDHSH2nSG-G3TRcvkXFHA35V3bkCM5TDnwJBo1p0NXqcv6DGpUkDODdnGU
Message-ID: <CAB95QAQfXs4VDr35UiuszqD2J5EmtKeqqHZh0K9_50X-T2MBbg@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add ROG STRIX B650E-E GAMING WIFI
To: Veronika Kossmann <nanodesu@rxtx.cx>
Cc: Guenter Roeck <linux@roeck-us.net>, Veronika Kossmann <nanodesuu@gmail.com>, 
	Veronika Kossmann <desu.git@rxtx.cx>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hey Veronika,

On Wed, 8 Apr 2026 at 22:29, Veronika Kossmann <nanodesu@rxtx.cx> wrote:
>
> Of course:
>
> $sensors asusec-isa-000a
> asusec-isa-000a
> Adapter: ISA adapter
> CPU:          +37.0=C2=B0C
> Motherboard:  +38.0=C2=B0C
> VRM:          +51.0=C2=B0C
>
> These are relevant to actual temperatures.
>

Thanks! So, there is no output for CPU current and chipset
temperature. Could you, please, test that CPU current displays
reasonable values with the following additional change:

diff --git a/asus-ec-sensors.c b/asus-ec-sensors.c
index 47e6c2db8b97..4a0b80012a6d 100644
--- a/asus-ec-sensors.c
+++ b/asus-ec-sensors.c
@@ -284,6 +284,7 @@ static const struct ec_sensor_info
sensors_family_amd_600[] =3D {
   EC_SENSOR("VRM", hwmon_temp, 1, 0x00, 0x33),
 [ec_sensor_temp_t_sensor] =3D
   EC_SENSOR("T_Sensor", hwmon_temp, 1, 0x00, 0x36),
+ [ec_sensor_curr_cpu] =3D EC_SENSOR("CPU", hwmon_curr, 1, 0x00, 0xf4),
 [ec_sensor_fan_cpu_opt] =3D
   EC_SENSOR("CPU_Opt", hwmon_fan, 2, 0x00, 0xb0),
 [ec_sensor_temp_water_in] =3D

At least it should correlate with CPU load.

And we need to replace SENSOR_SET_TEMP_CHIPSET_CPU_MB with
SENSOR_TEMP_CPU | SENSOR_TEMP_MB.

Cheers,
Eugene
