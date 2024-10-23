Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E39571BE238
	for <linux-hwmon@vger.kernel.org>; Wed, 23 Oct 2024 15:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729697113; cv=none; b=GJ3E+/cwLBArY5z4CJeaHiNz2+vK+msUTI7Zu2K4zL+2gYFZKfZChlsFF9IwUg/oab/cKMy58nXob/Tahtu0Zwf8ZwyfZXluDhTXftCt6WhtbkuZdGmkE8yPl+BJoCv12knDmLY0xnBtcZ3LY8xL/L6D+DwELOwhv8aBc3nw+d0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729697113; c=relaxed/simple;
	bh=8EhpWiMN/KQWfxYWK43+BaZhl9u8pDsOs0S+pCBIWiQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AjvPAxmejqbQ0lXNAa4+tEscAGWm2lema8S2rFxtOMUj2Z1O4tY0prMrqxlH+R7vyGjyXH5pjLofQS1vziZyaW6JvnheAEanLNp6V2ASbZBi55/JlGYya7chhfA53Vtkee3PpmHqLptiV+Q02lYU7Nfr4glZ/6uRNNjYGFVdAaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfYHO9I/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfYHO9I/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92FD6C4CEC6
	for <linux-hwmon@vger.kernel.org>; Wed, 23 Oct 2024 15:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729697112;
	bh=8EhpWiMN/KQWfxYWK43+BaZhl9u8pDsOs0S+pCBIWiQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=kfYHO9I/BHv7vdd12QUbUBxBi92/CY7SlsYvp7ndjafPkc/YSlBfvG5+qJDfu9K34
	 yOfFiNpCGz/CTS4LkGk49YAOMO3LTbgku8fjjP6fqV8wMdG9IwnonCjTpLsV0Or18+
	 RMQawTggS9wbt1FLuzk1bpqjrpG8Cgnrup3+f5Ii32IyEqc0ds+a6oIuSUTn0ZSSlG
	 WlzmseFY7FQMHCOsK3Fu/BWhRTghNNGA/bVR6ZFv8QHNATxBCk+zq/ca1BGUgkcYPa
	 RB4v8QdAgslv1GqQ15sLhtNW0c4lOEvtafKM2crhVgfVf2AP8+T15D3bSRgrY8IE07
	 HsgQR+iDM52Aw==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539e59dadebso8647973e87.0
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Oct 2024 08:25:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUI0kQ0V1CG6xFmJ81EKlvq3cW0KORzGabGhSIB/CmyxkwMVyOWj8RVulT9GfBmDukduepgmfDiD/kUjQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/twR7ah2PIbcGMCFJuiKl0B+NxgN4DxHOARKtNdyAC1nDhhbR
	Hrv3A+xAoELAJD98uj8qwLicVCUgVbg0YpdZKzcLpz08se9jjfZTXCV40wSZdy7vH2+Ey3JenDX
	qGOYb3E1ySUcLMRFa+t6OWkT6ag==
X-Google-Smtp-Source: AGHT+IE6fFl23kuGWAgetNo0KTxtutitT24dLQrn+JFDG2w3oPXOFV7JQrNMbn6OJaSvsQrCSLzDWM03mPEHv4nDSRk=
X-Received: by 2002:a05:6512:2c05:b0:53b:1f90:576f with SMTP id
 2adb3069b0e04-53b1f905959mr906214e87.22.1729697109988; Wed, 23 Oct 2024
 08:25:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20210923023448.4190-1-akinobu.mita@gmail.com> <20211011143421.GA2374570@roeck-us.net>
 <D056E665-7386-42E0-8A16-383B66FA3179@aspeedtech.com> <OSQPR06MB7252105381A0A3E8E7B80F6F8B4D2@OSQPR06MB7252.apcprd06.prod.outlook.com>
In-Reply-To: <OSQPR06MB7252105381A0A3E8E7B80F6F8B4D2@OSQPR06MB7252.apcprd06.prod.outlook.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 23 Oct 2024 10:24:57 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+yvRXAfZtVXHJjVZPd+n0x9E=KWyX6-+-M9OC_NJfBew@mail.gmail.com>
Message-ID: <CAL_Jsq+yvRXAfZtVXHJjVZPd+n0x9E=KWyX6-+-M9OC_NJfBew@mail.gmail.com>
Subject: Re: [PATCH 1/2] hwmon: (pwm-fan) add option to leave fan on shutdown
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Guenter Roeck <linux@roeck-us.net>, Akinobu Mita <akinobu.mita@gmail.com>, 
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, 
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 1:08=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.c=
om> wrote:
>
> Hi All,
>
> I found that these patches have been rejected.

Where did that happen?

> Is there any other reason why it can't be merged into the mainline?

I don't see any replies on the binding. Perhaps that's because it
wasn't sent to the DT list and it doesn't get reviewed if not. In any
case, lots has changed in 3 years such as we have a fan binding now.

Rob
