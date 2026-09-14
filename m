Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24876453A21
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 11:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386508; cv=pass; b=OQedX0y2sfmJgtlfOYLG4xeXV8+oa+bh4cBaULQ2nxwff90iwr6Ea0wLJPRieaOgvkr+LABr38Ayk5qJhcqX8KLUakqZ5cHUukaeBo1jFuixVbkJls0NN2lsuew+Sm8vkUbgOI74QBULd0skTHGGmSc7THNnSo1s4bS/jw9WWew=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386508; c=relaxed/simple;
	bh=gZ/R3Ilty8tUO0RrLd641S6UixU9v2y2z95SEd3LqRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hg+ucNjg44plbY08nJWpfJdHo9M0JGfW9wcHt2RnrrEhoWJy4oUt4oDleWrllRdCLq7Q6H8iwGho7AIsLBp8IDGsuZ0upeaMiRH7kjSWYqyNGtSRplj+vQO6YYley+qez5WBIxG8ZEi//dtz2zc7kiTXrDj38Vj6biGJomii+VI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qaj1Sf+w; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qaj1Sf+w"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-857ff9fef54so23358827b3.1
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 04:48:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789386505; cv=none;
        d=google.com; s=arc-20260327;
        b=MMagJTItnM07XO/XZ4NrlmJReAcXFSF0sQg5ezqN+94MNlilRCA5WyQNWxvqV66eZw
         uukJ4ns+lmY9j/X3FAQyBBAiSMz6pw9cOgXCjbj0AbMr6wLfqXXf01Ou0rJ/QzmGDGST
         bkO70TKSSyjPibrAnNsbMPepvwSqwF9bj+BaGAwE6B+ImWUcbaIFEYalXNyxsIAOtqpp
         19LqXGiGAGGtuC/YeP++cAblsThoViZNZjKAIyKogpKoufw1yqd3wDkCjAxu2OeTkvBc
         fSeoJ6iANDOdR7GSEgaIq456KwfnUOr9z1fIqFPNR8PNP2YxRRJfG56rPcBDDRKIT/3M
         OSLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WQVfeFzhlwSdobObUJDGaqY0dYod5lJ2/mueu9isQak=;
        fh=7RrmJZ9l1yEe/HmcFa7WJgyxXHu60CMiu6R1YBvyoYE=;
        b=kT4kDG4JSLgqQ+rlVVw1mimNSSFhULjhXLgY8PaU2EmlxHgpL7x89L3QRx/YL4B/F2
         byu85GIhY2N4Vgkxq8H5BuRtIhj6Xez/8jtQGlvCa444tq5H4Yg7URGrN9t7ojHz+xPY
         BLgKkcLQgpsMkT606ath0jYGCQzQayPB2OJdgZBkPo4KP8gmtdIsZY0RNFjclmrr5XBL
         8kqtys2ESxqCqaBRbctHLS+2FOPvxH/vOyUU79Z50zadBMaCcLW0kbmDEB+2BxYq1EmX
         xB7AFnf2Tml4htjfqoDnwuuhfyxYyXq4/zWwWwxHEe1T/L3BMWfeeJSrKxHziGhnh7Xq
         19wQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789386505; x=1789991305; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WQVfeFzhlwSdobObUJDGaqY0dYod5lJ2/mueu9isQak=;
        b=qaj1Sf+wT9+gzQLJaxWJpt0lVAoJte05mf6TrNfPMNqlP0rCinrQea8icFqz0+WJ18
         /RLEdTnKDSQLLN5uYldtTuvlv0d1U5o3VuXm9IHTKYv/oHOykSFqJgTsfPtsqGtFa7pn
         h4UiF1FpC7XA9fsBTXrZA2QldmyYAHY5qHF8i0uSTrnT7CRDxBuyALzD9kbd0qhEmci3
         /mbizXrMo9TuZSlpfIKrmUL3KnUhUCSs9Sx7me3Eccf+moMzHR5zUojbAiTZFsN5WDtM
         rlEx5zEaG8aMMR5efm3F+yeOfPqqQtNWbKe4QKw/yGe28qjrnkD4hOeI3COPAcn80cin
         3+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789386505; x=1789991305;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WQVfeFzhlwSdobObUJDGaqY0dYod5lJ2/mueu9isQak=;
        b=ivjVi4aZ9EtnjmgC9iLRouC7uryxSGFirV8riDqqfj6uUilHaeVXFUzBW7vz0SrR0+
         6sxK7l5EeFAk1Sfm5VJKsuJ8JMh+Ps7nLdT8DpNtVuHcqDzBfjhONQGTTxI2FyQ/ExrI
         7A3fRhZERZw7xG672Mer4j+ZAHkSav+FqjdqkLACzhrrwJPTdNZM8MwkW/VWk2Tve0xo
         y+dXBYnIvFOMAyetW0fe0/WoWVBVDaXFEWeuz/GMmGfn5QzwUbj+CurghZV6K0NP2dkf
         nl0uVPPZOytqQD10j5Fzd3vTxxTT54FZywnFCprpjYdK4aBFDd2yYqSwuG3a2OjVvH0p
         ukuA==
X-Forwarded-Encrypted: i=1; AKwUvByttyl6/FU0hf1wVkppDezLTrsOqKt6dt/SmpuLeIXuetgXQfWZP0OJ7tEgDk91gbLaFYMtbbKRF+JcKw==@vger.kernel.org
X-Gm-Message-State: AFuF++lTRvkTQ/BHk9migE8GrWoS5l+KUQBsZJAtQ3nCQzoCKA5b48yJ
	hZS5mJoFxH9WbJoueOpPLJUWw5mZtnyjoC0+FxsHfmtLFkt9rY2KdnmNo3ChiPRv17PEDyPfe1b
	f7lMgDr8TvovXNtVA55X+J51+Os2A0z/lSL+B
X-Gm-Gg: AYBFou3fkHDBnXxZ7mMJKa8yMsBDcSev2doOM7jJ76shPJWkWSZl8/lziq4K+AVE/qN
	u+j5kuQ9YlS18rZd1uw7cnxx3IK9xEpjayKs+y7DXKVcJ+U0vJdYhOJe/KIAJ54CgWFROyKQVWX
	XZ5cQO3qwn6Rr6UiutYtTNjnN4HqpMp6mqd9eMiCHXMS63gDgwpatPVhf09gJAx6wRQVBQ/gBWq
	+x2givDpV2IYLNhSUzpwQ3RK2SbQvjlEQa3WS32SE4Dz7gEVxuno8/mwwnUYr2CGbUWG1DET2w+
	CjNTEhCHOlD1lxzeR29/pGJRKHAmQvP4Woir4C3FDImYl6nbozvHphlmSsi2QEWYtrnWAeAQWO8
	WHTX4Qa7YSdFJ
X-Received: by 2002:a05:690c:6b12:b0:81e:45a6:bd53 with SMTP id
 00721157ae682-88d1de8146amr5488977b3.8.1789386504862; Mon, 14 Sep 2026
 04:48:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901111903.660681-1-congnt264@gmail.com> <20260901113227.3694B1F000E9@smtp.kernel.org>
 <5676f26f-72e5-47ff-882e-1eba979408bd@roeck-us.net>
In-Reply-To: <5676f26f-72e5-47ff-882e-1eba979408bd@roeck-us.net>
From: =?UTF-8?B?Tmd1eeG7hW4gQ8O0bmc=?= <congnt264@gmail.com>
Date: Mon, 14 Sep 2026 18:48:13 +0700
X-Gm-Features: AcwNN1XvtRxwTaLpX_SZwd1BIZ27KGKSUuOmKhDndAQIy_Bs9tDxnMd2jmhRjw8
Message-ID: <CAJpJ=Guqx0HsZz8SxPgSF3Bk_H0aNyqQ9ekv8s5puSBadDFB6g@mail.gmail.com>
Subject: Re: [PATCH v3] hwmon: (gpio-fan) fix pm_runtime imbalance for
 alarm-only fans
To: Guenter Roeck <linux@roeck-us.net>
Cc: sashiko-reviews@lists.linux.dev, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 10:57=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 9/1/26 04:32, sashiko-bot@kernel.org wrote:
> > Thank you for your contribution! Sashiko AI review found 6 potential is=
sue(s) to consider:
> >
> > New issues:
> > - [High] Unbalanced pm_runtime_disable() on probe error paths permanent=
ly disables runtime PM.
> >
> > Pre-existing issues:
> > - [High] Failing to resume the device at the end of probe causes a usag=
e count underflow during devm cleanup.
> > - [High] A race condition between probe and sysfs writes can cause a do=
uble-increment of the runtime PM usage count, permanently blocking runtime =
suspend.
> > - [High] Missing synchronize_irq() in runtime suspend callback for shar=
ed IRQ.
> > - [High] Missing cancel_work_sync() for alarm_work leads to a Use-After=
-Free on driver unbind or probe failure.
> > - [High] Unconditional IRQ_NONE return in a shared interrupt handler.
>
> PM seems to be almost impossible to get right :-(.
> I don't expect the other issues to be fixed as part of this patch,
> but it should fix all the PM issues.

Agreed, I sent v4 covers all 3 PM findings from Sashiko's review of v3. Hop=
e
that makes things right :)

thanks,
Cong

>
> Thanks,
> Guenter
>
> > --
> >
> > commit c1b61438a4a40096fe54d7b86037b9d5eebc1cae
> > Author: Cong Nguyen <congnt264@gmail.com>
> >
> > hwmon: (gpio-fan) fix pm_runtime imbalance for alarm-only fans
> >
> > pm_runtime_enable() runs unconditionally in probe, but the devm cleanup
> > that calls pm_runtime_disable() is only registered when control GPIOs
> > are present. Alarm-only fans never get it, so unbind warns about the
> > missing disable.
> >
> > Link: https://lore.kernel.org/r/20260830152150.27F5F1F000E9@smtp.kernel=
.org
> >
> >> diff --git a/drivers/hwmon/gpio-fan.c b/drivers/hwmon/gpio-fan.c
> >> index 084828e1e2817..8b28f0d58c638 100644
> >> --- a/drivers/hwmon/gpio-fan.c
> >> +++ b/drivers/hwmon/gpio-fan.c
> > [ ... ]
> >> @@ -553,6 +556,17 @@ static int gpio_fan_probe(struct platform_device =
*pdev)
> >>              return dev_err_probe(dev, PTR_ERR(fan_data->supply),
> >>                                   "Failed to get fan-supply");
> >>
> >> +    /*
> >> +     * Reserve this devm slot before gpio_fan_stop()'s so LIFO teardo=
wn
> >> +     * runs gpio_fan_stop() (needs PM enabled to disable the regulato=
r)
> >> +     * first. pm_runtime_enable() itself still happens at its origina=
l
> >> +     * position below, so this doesn't change when PM actually become=
s
> >> +     * enabled -- only where its eventual disable is queued.
> >> +     */
> >> +    err =3D devm_add_action_or_reset(dev, gpio_fan_pm_runtime_disable=
, dev);
> >> +    if (err)
> >> +            return err;
> >
> > [Severity: High]
> > Does unconditionally registering devm_add_action_or_reset() early in th=
e
> > probe path cause an unbalanced pm_runtime_disable() on probe error path=
s?
> >
> > If probe fails at any intermediate point (e.g., in fan_ctrl_init(),
> > hwmon_device_register_with_groups(), or fan_alarm_init()), devm teardow=
n will
> > execute gpio_fan_pm_runtime_disable(). Since pm_runtime_enable() hasn't=
 been
> > reached yet, this incorrectly increments dev->power.disable_depth. On a
> > subsequent probe attempt, pm_runtime_enable() will only decrement it to=
 1,
> > leaving runtime PM permanently disabled.
> >
> > [Severity: High]
> > This isn't a bug introduced by this patch, but does failing to resume t=
he device
> > at the end of probe cause a usage count underflow during devm cleanup?
> >
> > fan_ctrl_init() initializes fan_data->speed_index based on the hardware=
 state.
> > If the fan is active, speed_index > 0. gpio_fan_stop() is then queued a=
s a devm
> > action. If probe subsequently fails before the final pm_runtime_resume_=
and_get()
> > succeeds, the devm cleanup runs gpio_fan_stop(), which calls set_fan_sp=
eed():
> >
> > drivers/hwmon/gpio-fan.c:set_fan_speed() {
> >       ...
> >       if (fan_data->speed_index > 0 && speed_index =3D=3D 0) {
> >               int ret;
> >
> >               ret =3D pm_runtime_put_sync(fan_data->dev);
> >               if (ret < 0 && ret !=3D -ENOSYS)
> >                       return ret;
> >       }
> >       ...
> > }
> >
> > Because speed_index > 0, set_fan_speed() drops a PM reference that was =
never
> > actually acquired, pushing the usage count below zero.
> >
> > [Severity: High]
> > This is a pre-existing issue, but does a race condition between probe a=
nd
> > sysfs writes cause a double-increment of the runtime PM usage count?
> >
> > Sysfs attributes are exposed early by devm_hwmon_device_register_with_g=
roups().
> > Userspace can write to pwm1 right after probe calls pm_runtime_enable()=
. The
> > sysfs handler acquires a PM reference and sets speed_index > 0.
> >
> > The probe thread then checks the state:
> >
> > drivers/hwmon/gpio-fan.c:gpio_fan_probe() {
> >       ...
> >       /* If current GPIO state is active, mark RPM as active as well */
> >       if (fan_data->speed_index > 0) {
> >               int ret;
> >
> >               ret =3D pm_runtime_resume_and_get(&pdev->dev);
> >               if (ret)
> >                       return ret;
> >       }
> >       ...
> > }
> >
> > Since this check doesn't hold fan_data->lock, probe sees the new value =
and takes
> > a second PM reference. When userspace later stops the fan, only one ref=
erence
> > is dropped, permanently blocking runtime suspend.
> >
> > [Severity: High]
> > This is a pre-existing issue, but is synchronize_irq() missing in the r=
untime
> > suspend callback for a shared IRQ?
> >
> > The driver requests a shared interrupt for the alarm GPIO:
> >
> > drivers/hwmon/gpio-fan.c:fan_alarm_init() {
> >       ...
> >       return devm_request_irq(dev, alarm_irq, fan_alarm_irq_handler,
> >                               IRQF_SHARED, "GPIO fan alarm", fan_data);
> > }
> >
> > The PM subsystem guide mandates that drivers using IRQF_SHARED MUST cal=
l
> > synchronize_irq() in their runtime suspend callback before powering dow=
n
> > hardware.
> >
> > Since this is missing, the IRQ handler could execute mid-flight while t=
he
> > regulator is being disabled in gpio_fan_runtime_suspend():
> >
> > drivers/hwmon/gpio-fan.c:gpio_fan_runtime_suspend() {
> >       ...
> >       if (fan_data->supply)
> >               ret =3D regulator_disable(fan_data->supply);
> >       ...
> > }
> >
> > [Severity: High]
> > This is a pre-existing issue, but does missing cancel_work_sync() for a=
larm_work
> > lead to a use-after-free on driver unbind or probe failure?
> >
> > The driver initializes fan_data->alarm_work and requests an interrupt t=
o
> > schedule it:
> >
> > drivers/hwmon/gpio-fan.c:fan_alarm_init() {
> >       ...
> >       INIT_WORK(&fan_data->alarm_work, fan_alarm_notify);
> >       ...
> >       return devm_request_irq(dev, alarm_irq, ...);
> > }
> >
> > It fails to register a cleanup action to call cancel_work_sync(). Durin=
g driver
> > unbind or probe failure, devm_request_irq is unwound, which synchronize=
s with
> > running handlers but does not cancel pending work. fan_data is then fre=
ed by
> > devm. If an interrupt fired right before cleanup, the work executes
> > asynchronously and dereferences the freed fan_data pointer.
> >
> > [Severity: High]
> > This is a pre-existing issue, but does the shared interrupt handler ret=
urn an
> > unconditional IRQ_NONE?
> >
> > drivers/hwmon/gpio-fan.c:fan_alarm_irq_handler() {
> >       ...
> >       schedule_work(&fan_data->alarm_work);
> >
> >       return IRQ_NONE;
> > }
> >
> > The driver requests an IRQF_SHARED interrupt. In its handler, it proces=
ses the
> > event but unconditionally returns IRQ_NONE. When the kernel sees IRQ_NO=
NE from
> > all handlers on a shared line, it registers an unhandled interrupt. Aft=
er enough
> > unhandled interrupts, the kernel disables the IRQ line permanently, bre=
aking all
> > devices sharing it.
> >
> >> +
> >>      /* Configure control GPIOs if available. */
> >>      if (fan_data->gpios && fan_data->num_gpios > 0) {
> >>              if (!fan_data->speed || fan_data->num_speed <=3D 1)
> >
>
