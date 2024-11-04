Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17ED7171E43;
	Mon,  4 Nov 2024 08:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730707953; cv=none; b=mQMOTRPYfnQGtCNISLK32Qw3sJY67nJdSY0RjxmbV+W5PCzpEohyXyq2vAo1dll7FWjRhS9WgCRhLw2oq1Vfa8waUpojD/Xmuzo5g52+D2/N/CQrB4RYNX2p9aTrThnh5TSMzM0Hd5mD2IbGnG96EAbBYbYLKRzXqORWu+hmGNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730707953; c=relaxed/simple;
	bh=XCX6qrzCMImbBpxh+YBej+RlpN9TLIbz23OhwpXYnmc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GDVXjPVv4Ms+8LrH/+husEGOMWQc8XnisY+7EjwfjiFi5cLVzgxMsqwNrXEsEaFHgR63OpOsSaoaGz+mRpaH1/5KfIi2ksSLf35lqMQtdcUngDTvbLJfV4X/WrNWZfg85Z9bku1ul0dzo7Jznd8/lOeTOAhDhK4jfeFeIpXsH7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KK+oTxFF; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KK+oTxFF"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3e60f6ea262so1817098b6e.1;
        Mon, 04 Nov 2024 00:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730707950; x=1731312750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCX6qrzCMImbBpxh+YBej+RlpN9TLIbz23OhwpXYnmc=;
        b=KK+oTxFFcs+u1i9CwjG4zVojW2e+ghWt9HKgipoDkavZwKtbKWcsjHrYc8FqcvY78n
         3svg1HhDulsgcqPuvy3y0+eJCKQDMUEKmCsYziSeOQfEZfHkwB4k5j7AbRfYDdGhrel7
         oaVqmymH/oShujOcy5Jr28bRnhxmnOFw1+BGvOyjA2wnegPQrcC96gunjNaSFjcaK+os
         4TDJ85hRhXX6x0Un8j/dd1hXhwdv8imgqSN/yP9XPe35qYAYmmTUKHGgyvlhffOLHuzy
         5MXMb30blvSdFXIvSA3HLBhUEKGGoAP2T6HMzV0g3xwzfubAKxlVjFvrRm3fLXTXLApj
         D+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730707950; x=1731312750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XCX6qrzCMImbBpxh+YBej+RlpN9TLIbz23OhwpXYnmc=;
        b=AZEod8kNasDJ1PgFK+QevTNfC0JhA9hysft6W/UXYI93ZAbgC1Sr0qTiFJaJRfvW0l
         2qqt+P1QsbrFq1BFE4KPFV4JDxE9Au1yxaawkwjzoXEVK+OK6On1g2iypRt5kigL705C
         ALz77FHhu3yAmcrJmUxHAOFc09mRVxPxPalDAGj0opZFL/dL3pwGqOYeLxfDyLiKmSVz
         pVMMM44ApM1+0USRpg5WE8z2qehScK1Zq7tkdDnF3FqER7C7yzANcA3DaRUuGQO9cyxN
         UgL4tniGbgkx60K/OlrBnYJRY3b7qvVEnCGgrG0Ew+ssvN22yFJTQsGlzQnx29tFqxE9
         Mtjg==
X-Forwarded-Encrypted: i=1; AJvYcCVV7KER+SdLRgxBaTYEQqpUC4T4qdyveaQvJUHVlcIdz6GXxyvDkwrfIt1VmhNtea5telUI29JQHdH9@vger.kernel.org, AJvYcCWpaOGpU//TvlLWcQUFGnNYrg41T6Z452EmOXyUB7jnIfdm4hztUrs7hzmdo3ILsroDDnizW10VY0ZZ@vger.kernel.org, AJvYcCX2uiiDVX1wByIwWmnMzOEffG3sng6vLbtp3JXnnSp+3sdfE4PtejfDXTr3MNkf4ndDlrssUO1jiiBeXfk=@vger.kernel.org, AJvYcCXY6xK2uyHlmQS3XDC/upY8ZP0skZuj68dJ/dcN687cKOlG8z81Qo6YrLMdXQ47liaKF+YjYfHd5m6hIs+I@vger.kernel.org
X-Gm-Message-State: AOJu0YyZbAqZatLQecCMRLF6dWP3/xkEHG4OXWc48vBUth8+ZwFfrjMC
	iB2LGlXvGZOWMaQ0upngb/U0ysMJo1EudX9SMphq3Sm/YZFFPR14MUHVOSSvieWyTjfl7NRp+/N
	B0yc70Dxb3eP/rVgkvwJwdQW8Py8=
X-Google-Smtp-Source: AGHT+IHyNmXIv/Qkf7hr1oDZ5RSdZMwySKzbkHyHElTN8xOk9/nD1kciEaKHao+bZTDKxz2iSJGs2BZ1r4zKnk+g5NA=
X-Received: by 2002:a05:6808:448b:b0:3e6:23b7:bf4c with SMTP id
 5614622812f47-3e63846135emr26460681b6e.13.1730707950027; Mon, 04 Nov 2024
 00:12:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022052905.4062682-1-kcfeng0@nuvoton.com> <20241022052905.4062682-3-kcfeng0@nuvoton.com>
 <319d7395-680b-478a-aec3-08bae9177f73@roeck-us.net>
In-Reply-To: <319d7395-680b-478a-aec3-08bae9177f73@roeck-us.net>
From: Ban Feng <baneric926@gmail.com>
Date: Mon, 4 Nov 2024 16:12:18 +0800
Message-ID: <CALz278a9ypz+2j7yfHQ1t9M_HxJW_8oW6rmYOOgUSKCTxMz+Vg@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] hwmon: Add driver for I2C chip Nuvoton NCT7363Y
To: Guenter Roeck <linux@roeck-us.net>
Cc: jdelvare@suse.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org, corbet@lwn.net, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org, kwliu@nuvoton.com, 
	kcfeng0@nuvoton.com, DELPHINE_CHIU@wiwynn.com, Bonnie_Lo@wiwynn.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 1, 2024 at 10:48=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On Tue, Oct 22, 2024 at 01:29:05PM +0800, baneric926@gmail.com wrote:
> > From: Ban Feng <kcfeng0@nuvoton.com>
> >
> > The NCT7363Y is a fan controller which provides up to 16
> > independent FAN input monitors. It can report each FAN input count
> > values. The NCT7363Y also provides up to 16 independent PWM
> > outputs. Each PWM can output specific PWM signal by manual mode to
> > control the FAN duty outside.
> >
> > Signed-off-by: Ban Feng <kcfeng0@nuvoton.com>
>
> Applied. I did fix a couple of the nitpicks raised by Christophe,
> but I did not replace for_each_child_of_node() with
> for_each_child_of_node_scoped() since I can not test the code
> and did not want to make a functional change.
>
> Thanks,
> Guenter

Hi Guenter,

Appreciate your kind support,
I'll keep following your version and check the part of
for_each_child_of_node_scoped.

Thanks,
Ban
