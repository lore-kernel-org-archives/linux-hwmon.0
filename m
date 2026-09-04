Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA348391505
	for <linux-hwmon@vger.kernel.org>; Fri,  4 Sep 2026 02:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788489683; cv=pass; b=hntVLQe9isyWm4DZXspCZvJwlCX1qp1ZRmms+oARAMV5JhrjkA8MZGA5+s5vaDM2pPrt9dDZhla4WTmwoM1ZdMHfXW5TeBdg65PqtRqhrYG0BZ+nKYjDXPW3N9hVbFvsMj1nX8KBoikOBbMrYZlhbIp5+wrguR+7fvq1ZXnjShE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788489683; c=relaxed/simple;
	bh=haeN8BwgCyC9B0Qb8uV/x9/S4ZiukBNTmmqvdkO4bN0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=scaUyHO58acRXUrNIUCioZm7TsI5CmuJE3aCyayCtayzfnd34ex49j+CHZy3XLQ4RmCNaPqkeuaf+DyKdvWirra+i8wipN+vbyaijuhyv7HIaM7iaj2AbiXhrWo3X9T//3QsOKJQDjTP48X9D0q/0/se8EGNwKRZHY/Pm8Fdbpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=Ib+N6Z7H; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="Ib+N6Z7H"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6a18840e2abso680642a12.0
        for <linux-hwmon@vger.kernel.org>; Thu, 03 Sep 2026 19:41:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788489680; cv=none;
        d=google.com; s=arc-20260327;
        b=ehpDJ2SLnhzfFFZSTGgNNneEoU9ErGuGqN+xXz1+zCpwlaS/xzTa06OaU7wizuNHIl
         5mjT0UCeF8m3Wr2hjpb23RoTbUFGQLePhf523uGyXkcLK8OAu13FOMdmsAMHuKtUIxA+
         TXa0pebsdYTinlbAWD9m/kaSCjptzbxNu93nYrLuNRIiDN2xZba6IP7/TuR9KHGuo/os
         k66WtF2eQ0N9XR39d/ks3BB8TPbsJULcAI5KlAZO8aGKc9c5L14ld7leF7dVziw9Jkc8
         a8vFc0p/ipJqk0hPGyyP579PtkZrzdH+qaVLr+ojuNa6SWBb2wpDnZNbvKQKJZ5MHScG
         Vh0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=haeN8BwgCyC9B0Qb8uV/x9/S4ZiukBNTmmqvdkO4bN0=;
        fh=0hdvEPJRino8wRvGrrw1gATkOs6ExpSix2L2F38xNVA=;
        b=QWpGFXW44HaNsTrfKiLHQIDHm7amZyP1FwDh2uOBlU0oCTCYgdYRzVPxIjHG8aTObv
         hD1HsSjyyod7JHCVB1itqKrFgO/Z80ObfV+Vf+QPlh4N7kGzTITrC0/hVA0VQf/9/Vyn
         /igV8r/TJWNGN3obxGFO26oGUprSRgOWIWKtJGll3FqxZNlJreXpZc/u0SRLgVhV9nio
         6OGKbyqPUGm/P5BzaUMrG+Qs8PtxDqg8sGQvv60HO4lhTx+l8BPxgdJwhqGh8yLTFoyq
         B39YjDn6cIb8Mbzm54uuIm9AHXfoyWTQkplfgvQXca2MkzlBcOWz5MTvb28X3xNp+w9I
         UXPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1788489680; x=1789094480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=haeN8BwgCyC9B0Qb8uV/x9/S4ZiukBNTmmqvdkO4bN0=;
        b=Ib+N6Z7HnmBPxlKGQjLIBsTyhg9ZffHTZdkvlTtuXpUxdWQ9Bgbf70P66KV6cS/37p
         PiOR2Z1gv4bWBMsiz21dtco8J1dNS0mGj0i65CRATSJgVbB573pab02vVR55knahjrd4
         Y2kXRR6Wv8z7TFrzwGP+ezWPXGKDdgmfHQUCKbR0nabQiajZ69krjlAtm62cEXzE8k7m
         G8qB+t4JTpb3D8oh+uyv0gVlmWCZjSsuuKvagHXAe60w2IY61QYopVTIdYp4EjCMyHvt
         7ey7gHVmPz3w2lwQutJ1c6Ka11Ibt+FqHWL2A6EYfpIGCWWMA4kbZ/91qA5ePgn4+ByT
         furg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788489680; x=1789094480;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=haeN8BwgCyC9B0Qb8uV/x9/S4ZiukBNTmmqvdkO4bN0=;
        b=GtsZ+MGS+TyVaW8xZRBePF8YtH+kMiZ6n9ruYtEsntHGnKATno1vw9wxCZzpLlflNU
         0SSSw6h0XlGT7yquqoDjYSidXqZtZCBSVPQ6bIW1mNJ8DLtCXyHo8AvLhajAIiGBFRXz
         IV9Litpze0BM3UHK5Zk2yNzmv8ih0/QsYmmrBplASqBHxa1VVBm2G8Qjf1GHvfdK1/Xp
         z1OJMB8SLRNVALipU0ZUWeih4ySh5fhgb5R+UQKM5FHNRUKN3oLvfbVYhcDix6X2nFce
         DTrqNJl7fCqADbXCvfP/MqR3LBN++d6EQr7YUqeASWnGpOpgt1LGd8V/LowwgnoNiOlH
         prbw==
X-Gm-Message-State: AFuF++l6NZ7hySxweGD09Kw7WykI42fs0pI7V07i5wZRrZrjZ22rrz/w
	DbrcaBfFEE7EFaaf7CAq0tbDvRV3SWrAA9/A/DM+OnDW0SjzJOxLHOQ1bbI0bNcz2pUtht34rsE
	29v2rlXbokq47sFZIRIw0hCJP4lruwz+CzHNEuFOXKw==
X-Gm-Gg: AYBFou1N/YoyP5mV1yxLWbrfGDG3UQS40ISLVUZjHuV5ymX/r7KVNtqHddYyg1Sc6ku
	igTGJjuQHLL8xiJzkgawdPbvyzga2VMGur2cTqRAHsnFQ9On+A68bgcxpkrWI/4bkB+cA+CefLc
	W3DxRMUR18BnJ5aAAURazLNRzFeCcFb+dZkDqksBZEIW+B8o6UjwpE4pbG3zmmxOzJGesvTAT7M
	23HJMmWrfNynteKJ9Ahljx9z2qBdSbKvD0bzevjlncLaFgYRNerR7Mgq2NpodRuwjud9kZ2jD4P
	5KIHWbNys8KpWndwdf/c4WFoYBq9Wh4BHoJo5LErciz74g==
X-Received: by 2002:a17:907:c1f:b0:c20:d90b:2cb1 with SMTP id
 a640c23a62f3a-c260c48eb7fmr151929166b.0.1788489679824; Thu, 03 Sep 2026
 19:41:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260904022129.97896-1-renari@arimil.com> <20260904022129.97896-3-renari@arimil.com>
 <20260904023424.B3E601F000E9@smtp.kernel.org>
In-Reply-To: <20260904023424.B3E601F000E9@smtp.kernel.org>
From: Arimil <renari@arimil.com>
Date: Thu, 3 Sep 2026 22:41:08 -0400
X-Gm-Features: AcwNN1WjASArX-YhmXTGtQG-Eun6uq676mwBPhxrZKuoGIxqwl0m9gJaLnPlvvs
Message-ID: <CADBHdQ2g0uX3rrjdE8+BiO_2n5Ld2FOesgeowTzKunuAZhaLaA@mail.gmail.com>
Subject: Re: [PATCH 2/2] hwmon: (asus_rog_ryujin) Synchronize HID command and
 report handling
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 10:34=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The driver starts the hardware and registers hidraw before initi=
alizing the driver's spinlock and completions, leading to a potential NULL =
pointer dereference panic if a report arrives early.
> --

This is a false positive, this driver does not call
hid_device_io_start() so there will be no early reports.
