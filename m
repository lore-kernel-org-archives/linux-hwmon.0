Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91D23DE44F
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2026 20:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783369001; cv=pass; b=MrbERcE51tNmqESUPjfC5ZMwvBSxdZXSEJkUdxebtccADRPGNKGbPKgVgEg+Yopmr1PP0v08HBOvS1aSsNAKaOub6A9FubwtKRlSPVFyfaDvSCxxZO20BL4x24j8YmUuga7/HubQGmImQ9eALfO4XXBuwFarBphWs7i1KpmcabQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783369001; c=relaxed/simple;
	bh=Nu1n3P0H/PqCDPPN5O8qeN0Kol1VNlbQ59bExjVbgxk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R2oM4e73ZwQItZp8NJRww26tAfNXmaKB1jB924UTjY0wrTCkrKVA7j6BlddbgnQ3P5j/djD81lyqRT5upCRUUiMqd4YmbI7GfAwXkgWcUPTAIAboJyhnXSWBHVQK3TL60DiUHTqRDXhrZGksCs+nQqQu12WsdJHZ9mjcz5mMy8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mIGi5Gk3; arc=pass smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mIGi5Gk3"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c12788a75abso474011966b.2
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 13:16:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783368997; cv=none;
        d=google.com; s=arc-20260327;
        b=OYo8AQWzLR5VWMIeNw12pyJkAwg7vE88qQYWS5RhAGs31FyjAAIp240V2/hX2YCnUj
         7LFODqyMf5RBW6bVKHvKUhXMLIiGkZeDV8xWpIAe6yhOTfnW2dTV7zsC/tCN+9R8ZJEK
         8tVK5cDFiz0P/M3DN/TdSpMPAoMHcTi+FDi9d4snBvJejG0dF0tyVLzd4H6b5cSd5oS4
         eAsjfLmkHB4wcFx7R4UqDFJ5rHlZOuNOMOyoaMhiRP9dOVPlHb9H4va3tZK0nvfDbV33
         kqFK6aiI2MSwHZLGndST5BctjWxAEhlIyor5rGH8cxdGLrm2IGcA3jvJBKCJ9WNiwtE7
         9KHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9pBJoWz2KVDEcp83hFhwOpAIYz2D5CqgLGqaymILgZU=;
        fh=hXvYT/xY2n5rjYAv9Xql2SJhrNJBGB/nCzY4Lp8yLIw=;
        b=rSBwRitY4LUGUv99M9qEd9PNSphtlVc6Pv1QEEHq7fQd2vcz8qtiCVw/R+NQOIS8Y9
         UHp+hdrx6yY/E8NdN1k89XoH2IJupULZjdUludUVc1kHZsYWkZiz0mbxrWYhmVIMYOeG
         j7MsluVAPNBTAsIt4n6VjLD4QLQ9KSG9efjuKoOjV8BHp7cXWbxp8UJsJhkHOZ8eE68k
         qzRPlUCzBV/9eoJxaPnnPvGNBUycSfmB+AlDKKMu8gZOO3f3UpQmVEb43KSE+WWI7Jxl
         X5KYv8Btihxamkp0uGwebZrvOc1i9VnJQYnSI35absWk8LurOnqVH3NJcOPdglQPJiMs
         p0Hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783368997; x=1783973797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9pBJoWz2KVDEcp83hFhwOpAIYz2D5CqgLGqaymILgZU=;
        b=mIGi5Gk3ItFeCbcpJW3yMfLVXD/4Xm2GqGRwzo9iUjV6WqxPjjcCqASwszdhLbBZsL
         ZK14uL0DLXFbQaeMZrp7r/9KDLnSSA7qyymi8bnV6RDz7HYW386TohinGS0TCk3FQBgu
         cHzcnBLhG4zwMIgidAg9HCfnD3jnkeXvObKzstLKmqGX+OGShYVVZSSSpXKcfPbue4GU
         4LnOYmlJsHvNQnfQIyPTcHXCXYy9ij/4TC7PWwfPk8bKyb9rGotrns3msJ4fT7wszTuG
         0i7A+JpSXeqdnIgKI0y+xr89BHnFE3e8/b1TbG50ZIR8Qfm/wyi4uI/XtVoyB6/yHC+p
         Auqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783368997; x=1783973797;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9pBJoWz2KVDEcp83hFhwOpAIYz2D5CqgLGqaymILgZU=;
        b=awsD8pqkjYY1xNt9yu3y2EttqomLl/BylTemO/TFix/GkKsVRT2PuxLkE2Og6L43ey
         bNYb2rTBY5dXrZi/m6MLZGigorHZmDj4GPwVHsHDKEHeRricMckSWPPsT9Gstb2Mum52
         den0NAAIsk/cGX4eh5xalCp0kTBIQk01JaCPZLd9Kh4qIVA/7S+Djw8GzGdAStznQcbf
         0DwoM9KDCcd/NE/pdsgeDqqdejVRaS77VycglZHZXXDazwDAqk4miMG/S4PPmSzDk99Z
         5K6PtMVNn0aqmGJ9bw8GOVyX9RMYtCLl+QxB/lchv+gr0cQ1LpA0uPDXdtm1PMClNTtS
         zk5w==
X-Forwarded-Encrypted: i=1; AHgh+Rrcgmkvl8T2oLP+9e/6t1Db8C4puEGPVzqm38WF/rhj8YsktIuKSzLKIS6v0Dz9xILyP99BWIouZFNbpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwHTAHFFE15d4VfGbA5rx0NQcpipq2Qt6x6me9S2DsAnGZkh+jj
	6/rKMUSGqrlFgbIKRqwY+XI4mZkgidoOEW3Guy+0EsWZRIkqfj5IwiSP3frto/OJTUhdFSkYlEV
	G70k24wi5GCe+XGap9sca2uPxCf4yVg==
X-Gm-Gg: AfdE7cnJEnJueio6j4WyyAmjdQPz/B9j9lirq6a2uJ83mRwZIoSTFILTc4Z/RuIIKf8
	X8RpnmbAC8J91amDSsokZHhkkPVO01C2uBDHyicw1D9ckivFYZWiWiOaCJlyR7E2d8qo3gvQ/RB
	GSBYEdmvCcz7iOQulqbK+vy9XNZpnnAn40YtKZlhjeh2PMoPGyaw8WzGovUjCJ5QMaOqxbhTsN3
	LUXjKvAfPPvRoTflrzjLxK6FqBoyRjjYU8q2LfZu1cBz/zpaaDfRkQJIKjCAw0KAc9m8YsNGfir
	prS62aB23s0ak0XU3m8QpsV8CiI=
X-Received: by 2002:a17:907:a709:b0:c12:caad:6efa with SMTP id
 a640c23a62f3a-c15a676bf23mr118992366b.4.1783368996638; Mon, 06 Jul 2026
 13:16:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260706162519.6087-1-animeshrai853@gmail.com> <20260706205708.1da4fc75@pumpkin>
In-Reply-To: <20260706205708.1da4fc75@pumpkin>
From: Animesh Rai <animeshrai853@gmail.com>
Date: Tue, 7 Jul 2026 01:46:23 +0530
X-Gm-Features: AVVi8CcxQP27Mg_jlANYs4KKg12XM9KDF1JI9RDew7Rkjj6Nk0AxTUizccJeZwE
Message-ID: <CAJkfjrtGfgRE+jhsCyd7tQS+jGRSx4tFK34RkHrGFHQ5f=N40Q@mail.gmail.com>
Subject: Re: [PATCH] hwmon: emc2103: use min_t() for explicit type in fan
 target clamp
To: David Laight <david.laight.linux@gmail.com>
Cc: steve.glendinning@shawell.net, linux-hwmon@vger.kernel.org, 
	linux@roeck-us.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry for the noise, I misread the types, the operand was already u16
and the cast was unnecessary. I once again apologize for wasting your
time and disturbing you.


On Tue, Jul 7, 2026 at 1:27=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Mon,  6 Jul 2026 21:55:19 +0530
> Animesh Rai <animeshrai853@gmail.com> wrote:
>
> > Using min() with an explicit cast on one operand is fragile. Replace
> > with min_t(u16, ...) to make the intended comparison type explicit and
> > avoid implicit type conversion.
>
> min_t() is worse than having a cast on the argument to min().
> It just casts both arguments to the specified type.
> If you'd tried you's have found you could have just deleted the cast.
> But why is new_target u16, it could just be 'unsigned int'.
> That saves a load of masking instructions.
> Were old_div 9 and new_div 1 the rescale could overflow 16 bits,
> overflowing 32 is much less likely.
> (The surrounding code may make the overflow impossible...)
>
> If the code even right?
> It ignores values 0x1fe0 to 0x1fff (assuming the high bits can't
> be set) so they must be 'special' in some way, but doesn't stop the
> same 'special' values being generated when rescaled.
>
>         David
>
> >
> > Signed-off-by: Animesh Rai <animeshrai853@gmail.com>
> > ---
> >  drivers/hwmon/emc2103.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwmon/emc2103.c b/drivers/hwmon/emc2103.c
> > index 27dc149a3ed9..fbb1b4025eb7 100644
> > --- a/drivers/hwmon/emc2103.c
> > +++ b/drivers/hwmon/emc2103.c
> > @@ -348,7 +348,7 @@ static ssize_t fan1_div_store(struct device *dev, s=
truct device_attribute *da,
> >       /* update fan target if high byte is not disabled */
> >       if ((data->fan_target & 0x1fe0) !=3D 0x1fe0) {
> >               u16 new_target =3D (data->fan_target * old_div) / new_div=
;
> > -             data->fan_target =3D min(new_target, (u16)0x1fff);
> > +             data->fan_target =3D min_t(u16, new_target, 0x1fff);
> >               write_fan_target_to_i2c(client, data->fan_target);
> >       }
> >
>
