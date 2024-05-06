Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928AB15573B
	for <linux-hwmon@vger.kernel.org>; Mon,  6 May 2024 16:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715011812; cv=none; b=SjhVmKUGxFIcniKf434TtAPtYS3qgbc6/srRt3olt/8q4rvGzkGP4yfG2q07rQaUutKvS47S56PDVCl4IgXtulUWsNMWjDhXjW/LPit0xEFMkwLDDgpkd1HGUtmjcuL9OTqk5H5VhKKqVq3bmFKh96ywL7nT7I6JZMtnhdGcjDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715011812; c=relaxed/simple;
	bh=eCmNUiiRJVnsgoDYJTjnI91mf0WYtOPxNku6ZSZtSbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PxPtw3kZBZtlK/RHoQY9QTfyOhhmw4qNlzA3xjYe2tAxY57UlK/E4mU6CtX4moZQWCyoOIv3cIzzpEzY8y45GRG5C1fwZFC0sOUFgnK3nC3GU4oNIMQ7oGo1FDwSUetvFoOgz+qH8dbbtp55dhbzUPF/VjZdmRBQcBvmUmujTkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=JP2UrXd8; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="JP2UrXd8"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2e3737697d9so13162431fa.0
        for <linux-hwmon@vger.kernel.org>; Mon, 06 May 2024 09:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1715011808; x=1715616608; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nutCb6hy2mWUIhHOiW3+RagNvLqQap85OsgVrcHl9dk=;
        b=JP2UrXd8oxpNA3+Wo/ajRNeWFLDxoAI08dIJh9lYrCK/2vapSeeKRitLRJzCF/el51
         fT7RsuwoAGI5MSKkn2Int4Faf4QasgCUNEdaDTll614H0/WXmtncPeg5CCA+Ak6kimfx
         pXI8+0u/ch7TeFcRhdqY1gJLEPI2LBKUOfgBhm8zcatTDUE/ZFhuBtKFL7/iyA6ttKkm
         o9W2jL+3Jm8KCCJXyMZGSwWLQ6RxYcus1RqhmJOp7eWIRV9gcjO+a3weU2oVEMEJhHr1
         2yJsDMKKiLny1lM4phNr6UbJIbTnJzoyWipPCiN3QPkwYEDsxtpZE4PlKv1OzjdmP5cV
         8BMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715011808; x=1715616608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nutCb6hy2mWUIhHOiW3+RagNvLqQap85OsgVrcHl9dk=;
        b=IpbzZeLN6zDABnFpNZpzDvT2Z9H3pBomAyXiPUcbyVGzLKNQtP5UZp8AnCclZnJsj5
         YRgrDH1ekIVeJdPKyQ+C0ExQSrrsch3RC8dBIRkfc4yqovYb7Ou7hw0DI7K4xpi1zYpf
         bx3+TxHghDy6YGXeGgnTVjPbTFUB6Pv9HRVHfb1SbrDaP7Bdx0apsCyhCJzBqh5rimsT
         7GuHZB1A1PNsIrKK4X9neDSaYE3rfeNjec1zwXz/1dJXVEiksYcZqUMVaPnE4dQL58ah
         uwW3geCy6WnvgCam+qWpO9Jbl1U6kBqBDm6bxl//DgRe2uDJSYb1Qj6FrJ/TKtPK6ySe
         6Yeg==
X-Forwarded-Encrypted: i=1; AJvYcCVLfW56ogPvyT4kRE8rwhS1uwIUpVKbtinQj77QqdJq13cwGJUiWQ1AwiXjlrc1+LGzGUy6oGMNaxi+fDJlpZU/h/lVvLjGlflOgqQ=
X-Gm-Message-State: AOJu0Yw+NbFKCzpzSbfzpIhUcXId+PXZmu47taHN9q3Nc0wJj809hvSC
	BVH+ZqyEbrJXmKMuH7CFG0IMWXmxpdbsUitbHpn6NPdzArEKIknNESr5uHMHIewvEFPNCdNLUSW
	0q4l2LVbXRA303+4gbzj/+OUw4WC6AQ5OqlouwA==
X-Google-Smtp-Source: AGHT+IFxBzWxShB6K8Au7V8PY/rACcHC+u67upHljxePNYb/sfK3sX2UX+dZzknbFTW6GN7T4L5DGWVxF4IItIRQjKc=
X-Received: by 2002:a2e:3a19:0:b0:2da:bbf4:81bb with SMTP id
 h25-20020a2e3a19000000b002dabbf481bbmr7101049lja.2.1715011807732; Mon, 06 May
 2024 09:10:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240429-regulator-get-enable-get-votlage-v2-0-b1f11ab766c1@baylibre.com>
 <171500756002.1968386.17290951989557329800.b4-ty@kernel.org>
In-Reply-To: <171500756002.1968386.17290951989557329800.b4-ty@kernel.org>
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 6 May 2024 11:09:56 -0500
Message-ID: <CAMknhBEADE_fY+naO46Hf6gDP=H-Ap_dG6jRRzU6i7WR2J7LkQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/7] regulator: new API for voltage reference supplies
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jean Delvare <jdelvare@suse.com>, 
	Guenter Roeck <linux@roeck-us.net>, Jonathan Cameron <jic23@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Support Opensource <support.opensource@diasemi.com>, 
	Cosmin Tanislav <cosmin.tanislav@analog.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Antoniu Miclaus <antoniu.miclaus@analog.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-input@vger.kernel.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 6, 2024 at 9:59=E2=80=AFAM Mark Brown <broonie@kernel.org> wrot=
e:
>
> On Mon, 29 Apr 2024 18:40:08 -0500, David Lechner wrote:
> > In the IIO subsystem, we noticed a pattern in many drivers where we nee=
d
> > to get, enable and get the voltage of a supply that provides a referenc=
e
> > voltage. In these cases, we only need the voltage and not a handle to
> > the regulator. Another common pattern is for chips to have an internal
> > reference voltage that is used when an external reference is not
> > available. There are also a few drivers outside of IIO that do the same=
.
> >
> > [...]
>
> Applied to
>
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git =
for-next
>
> Thanks!
>
> [1/7] regulator: devres: add API for reference voltage supplies
>       commit: b250c20b64290808aa4b5cc6d68819a7ee28237f
> [2/7] hwmon: (adc128d818) Use devm_regulator_get_enable_read_voltage()
>       commit: cffb8d74bd4e9dd0653c7093c4a5164a72c52b1f
> [3/7] hwmon: (da9052) Use devm_regulator_get_enable_read_voltage()
>       commit: d72fd5228c9f2136a3143daf5c7822140211883a
>
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
>
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
>
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
>
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
>

Hi Jonathan, if Mark doesn't pick up the iio patches here, I'll resend
them after the next kernel release.
