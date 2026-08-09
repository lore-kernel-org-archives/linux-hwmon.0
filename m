Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8C6307AE3
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Aug 2026 20:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786307166; cv=pass; b=mTrzFuhQOcxBiSFCAse4LOwyzUFzxfxktrFghe8Lnh8ZsltK5a91w0+jyuZpIly4UQar53PdbH7fAqS4i1Dm7Nk44T8ZN9Ms0Uk6aMYwgv3iQefKgHEML9CWvlIk5IRtWZaPVYH+uARiekmR17xkiaDbKBCj8x0XYU55EeYGH5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786307166; c=relaxed/simple;
	bh=41vI+L+3s9LTymGuiRCF9G7wxY7ZJbn3re5Ns7804+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=onEW/84ZlMnEG+KtG8DgjAEE2hNISES+U17y+/wcp9LD6hjCuVOyQi0ug6DInhniIZ8O4Tf3z+OQ2j+FjCeVyrepcpSqmeJOSggnxhTT3H56C77qqWvqXJPCg5I50T3grdNkCtgEPvnBuSrOS9oax7hET2JVKnHOWjZ6W9Ej+Ao=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=EkQU2P23; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="EkQU2P23"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c16794450aeso145308166b.2
        for <linux-hwmon@vger.kernel.org>; Sun, 09 Aug 2026 13:26:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786307163; cv=none;
        d=google.com; s=arc-20260327;
        b=Pib5fQxir2pqTQ7/HvKMl9RdXGnGYmkOF/J2ZPTB6uu3bkAVrvr+vNKqvzBo0QCmOu
         9tdhYN3lxJWge1NPi8iy9o3idB5Z63GNDzvAytpvGE/nVKhzU/+mXzmeBaXCB3OaxFfz
         B+41gwKZZMfwTv7sApsjQb/sxRc6+BxzG96YbYrRZZ7V7sNcM5f9kciwr7iaFfowQeX5
         UBvR5V7wxfJkqHj+O6xqdSHAUFm/Tk9wV8NbeyVNYsFBxlGACgHmVA6YpEbd2SFWmCTb
         d+fDKCdx6nu8TIt9QRQ8mgcxSGuAHgl6akQqF+eASm11vDxXUkYpzBwen5yhwuyJ6M6F
         QdyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=41vI+L+3s9LTymGuiRCF9G7wxY7ZJbn3re5Ns7804+U=;
        fh=3aKCN0hVB26pYQtK0gKqv0lUWMAgoTQeQMPQCWDJA44=;
        b=g+5vYdxTNAG3L7E7fHpAFpHV5SoamWa63voTjkgElOnurAACyn0AOP5FgEQ7TfBccE
         W/hp6b6Nch8rFn6HL3qe7i1euBorza+VgLSKFHXAAIioepy5NhyHKG+pdEBu4+kq760H
         Sw7p+SVhQ4n4ATeiZKpvggAiaDh0r5dDXNKn26aZLqNqLJYm76sBsF/P1cKGJdIX1ttL
         JzvriIp6tn7HcL3iF+c8qGID3Gpic3eaPEFzEtRWJEmXu67hfVobY2xj5AFUkrGid543
         jP8cUdpFEsmGThCrHuMciV+xdtu60sf5NSgDuaifjQWK6QytXg8gPDP1aYQZevs1oeLx
         ir1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1786307163; x=1786911963; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=41vI+L+3s9LTymGuiRCF9G7wxY7ZJbn3re5Ns7804+U=;
        b=EkQU2P23hWudU65X3pNAsDrWMa7JodesoXNWRJvesuy8bLiIGxRFu7TTk6Tn8sCNvo
         YflNuJGXaX3JQuwpZRSYdvwTuNIMdkooESJctz0sBsBXnZp3gEmVWtWIZ565T9GKcFIk
         tXjKFRUWv3KWw41RuZ38rm6h0DbAPJ100Mm1hN+FjQ1Uowxso/DLLJ9UrvFf6Jt0wKJ/
         699gllUOXV8MWX39UqUVPFkXQKckJrQH6gZfKZG2tmBNLatRnnxp1J0FuINxwcFm3TDP
         0a2PaDjGEVISa0Jb4M9G6KH8LbIlZxTruiLCRqQsuCsZ4231EV7JhTtO4EOputTdS1WL
         yQkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786307163; x=1786911963;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=41vI+L+3s9LTymGuiRCF9G7wxY7ZJbn3re5Ns7804+U=;
        b=NFNlslk1PNMB6DasskjL9XaDyjCu3hLSee7n/97vspMAIYRdXqkTe9x9nvNw+p7dYN
         pEPyp1utwBm9YdrwjwXgbBVDGSh+O8cOQWl895398O3diIj59HVNiqqGuzBcQCqQPc91
         hqggrtuRAYVHGxuU41QCndeGKKy4RAx5KHfP4LvdUmKcdfQ2wdZT9FXKHhOEZzHTfp17
         xC29T85K+C5XRU/qIvQR7ortbajpGOp6Dcc4ptQ05ugPrdrhU5twmPvSdOkAkCCrSjoJ
         sDa0S+scKPCnT1HjqyfTtwgNTySENstJZOqLD/wM9Mg71GEl7TNH2cJMBXJK7DTn1Nhu
         p91w==
X-Forwarded-Encrypted: i=1; AHgh+Rq7/rmBlIYYqWoszizrZ/tmO4Ip6DSMpE9Hnsuy1tGEA3wyrJD4cnGIGjFZ7nWq4WNdsmGOKncOhdOTTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUOHN3hJ63gra1XEChiCSSXiMidl9dmKnyYLtDDNno1X833Z7z
	P/kLtKvoU6yQ7ANnRlY8qvfH9wJjwA1CFwVujRtNqk5tNduyn/289Cabz0NQPsh715OkSy7l6i/
	5eq42GohEjnWrcq2r9l6+59DQTzbii0KviXDDh/Lrfg==
X-Gm-Gg: AR+sD11uZ7h0H+6kaYd93B/R7etLtLzLb6vSkwuEltCo4rMpb3kv+kWv8Df2RxyGCsH
	giCMiOU0mCmlmh9dCmKLU5ZseZmfhLkp4utN4ERgAwcWVd4ZpApAU0Xgbo1aRZCmUXJOrj6cfcV
	2HQpq8U9r+2MtehxdL/VJlOeOIuepxUr3+41Wb6danMISGEQbX9YsWaegTm0KYuABYlSsVfxwMH
	DVVgfoqquJGEU2zHozSNRh3fufboDG706Uo60vdPxiCO5Xg8IT7E3euzNMxo5zRZT+DSUq8oIRC
	3860RrQ/v3uRl+tXiedNQyw0QPo/S7SH8D0Wqv4ozxQcjw==
X-Received: by 2002:a17:907:3ea6:b0:c1c:208c:c04c with SMTP id
 a640c23a62f3a-c2039e2c327mr1725890666b.27.1786307163324; Sun, 09 Aug 2026
 13:26:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807000107.1786892-1-renari@arimil.com> <20260807000107.1786892-2-renari@arimil.com>
 <20260807001412.B61901F000E9@smtp.kernel.org> <5a817284-a9f4-48b2-9f0f-802c5dc6963c@roeck-us.net>
 <CADBHdQ3x4bFe518q2PjZvGJ2=qP45+5Cmm8f99J9gRZCJun0aQ@mail.gmail.com>
In-Reply-To: <CADBHdQ3x4bFe518q2PjZvGJ2=qP45+5Cmm8f99J9gRZCJun0aQ@mail.gmail.com>
From: Arimil <renari@arimil.com>
Date: Sun, 9 Aug 2026 16:25:52 -0400
X-Gm-Features: AUfX_mz8gmq0KbPhziNuLRWigX7b7YR9JyLRCiqQe7spoeta_my--KKNVur9_vo
Message-ID: <CADBHdQ2e_ib9Ci9O2QQYqZ8iJfD=RwCCHF4cSaBzigvheN0GPg@mail.gmail.com>
Subject: Re: [PATCH 1/3] hwmon: (asus_rog_ryujin) Add per-device configuration
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sounds good, I'm very inexperienced with the kernel workflow (I didn't
even know you could e-mail patches directly from git). All of the ids
passed into this should have that data, but a sanity check for an
invalid id definitely can't hurt. I'll make a new series and open a PR
to the drivers github repo with this change sometime this week.


On Sun, Aug 9, 2026 at 4:23=E2=80=AFPM Arimil <renari@arimil.com> wrote:
>
> Sounds good, I'm very inexperienced with the kernel workflow (I didn't ev=
en know you could e-mail patches directly from git). All of the ids passed =
into this should have that data, but a sanity check for an invalid id defin=
itely can't hurt. I'll make a new series and open a PR to the drivers githu=
b repo with this change sometime this week.
>
> On Sun, Aug 9, 2026 at 12:37=E2=80=AFPM Guenter Roeck <linux@roeck-us.net=
> wrote:
>>
>> On 8/6/26 17:14, sashiko-bot@kernel.org wrote:
>> > Thank you for your contribution! Sashiko AI review found 5 potential i=
ssue(s) to consider:
>> >
>> > New issues:
>> > - [High] Dynamic sysfs IDs (new_id) binding will cause a NULL pointer =
dereference because `id->driver_data` is unchecked.
>> >
>>
>> Looking at other drivers, this seems to be real. See wacom_probe().
>> Please add that check.
>>
>> > Pre-existing issues:
>> > - [High] Missing bounds check on HID report size before accessing payl=
oad offsets in `rog_ryujin_raw_event`, leading to an out-of-bounds read and=
 information leak.
>> > - [High] The `status_report_request_lock` fails to protect `reinit_com=
pletion()` from concurrent `complete_all()` calls in `rog_ryujin_raw_event`=
.
>> > - [High] The device is exposed to HID raw events before its completion=
s and locks are initialized, risking a NULL pointer dereference and kernel =
crash.
>> > - [High] The driver allocates a DMA buffer using `devm_kzalloc()`, whi=
ch breaks cacheline alignment and causes memory corruption on non-coherent =
DMA architectures.
>> > --
>> >
>>
>> No need to fix as part of this series, though of course patches would be=
 appreciated.
>>
>> Thanks,
>> Guenter
>>
