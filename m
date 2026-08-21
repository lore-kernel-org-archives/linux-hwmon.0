Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973103DDB0B
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 09:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787305033; cv=none; b=Jv3p9j9x5C8z1Ak+fEWB3hw0KD8Fmuf4f0fYYyERDSsyBmApzlDVht5FrigZV/LfhYGFNcVzpmcZ3e2GCxWu22HDZ/kCqTF0O1jQh2ShG6JlX7Avmo//Dh2Ct4cyLb9lkPhZp0GhTYUAZ9gNL+wlGy3oLHY54DuSMQxqHAcyLAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787305033; c=relaxed/simple;
	bh=hGhWJluhJSizDITtQ3uZNwS3pMnaIP1GUKO8Bzkdpqo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FRc568LmGPps8UnQO4dSuGPlCQEWStCamdDuWM7BTgA9nxIhiwE3g9jkyjOmj350NQiWodQ3HTATUC97Q2sndm3jIvA9VfBtlBMInULnHL7fiw2GN/8IO2YJ6EJTfPgAZ1ikwYfhRCKOK/JYWVBQ1JsFTOfwiO3LusuHqUISFr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jDpSFc26; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jDpSFc26"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1EB11F000E9;
	Fri, 21 Aug 2026 09:37:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787305027;
	bh=hGhWJluhJSizDITtQ3uZNwS3pMnaIP1GUKO8Bzkdpqo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jDpSFc26oA9uZPSriwi0X27nRnmsbf5epAEavdLQ3VcKx64ug658VbPMC+6yRCwuG
	 xRMl3VcMYktrH9rDNR+hwzoLaUEulevtd2jV45LuG8e45mtPfSOvLd0GJ7m4QykheC
	 YazT3sVmNE3sdYBqvRgOGPqlUKQkxFRvxeReYFfPz8ViVJ4ZGY9KbCsrZJ6LdwSO5V
	 rVpDZUaDPgZz/eezhh3e+yUwxLK4K4iAcbf5AHH5p3E28v/Wffq+1zfoucxWJaReTr
	 cqRc0t9p6r56//4RX9O00d2xshzyM5a8xCY4RT0rvsCDQLrKOB6sbripVPNDTMLDi/
	 Ju0Hs289zyBUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: chipcap2: serialize access to low/high_alarm
 indicators
Reply-To: sashiko-reviews@lists.linux.dev
To: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260821-chipcap2_locks-v1-1-1d8ccabfc1b2@gmail.com>
References: <20260821-chipcap2_locks-v1-1-1d8ccabfc1b2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 09:37:06 +0000
Message-Id: <20260821093706.D1EB11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Low] The driver implements custom locks for interrupt synchronization in=
stead of using the hwmon subsystem's mandated locking API.

Pre-existing issues:
- [High] The threaded interrupt handlers pass the wrong channel index to hw=
mon_notify_event(), causing the sysfs notification to fail silently.
- [High] Threaded IRQs are requested before the hwmon device is fully regis=
tered, leading to a Use-After-Free (UAF) during driver teardown.
- [High] The driver permanently times out on all measurements if the regula=
tor is already enabled at boot or if a previous disable failed.
--

--- Patch [1]: [PATCH] hwmon: chipcap2: serialize access to low/high_alarm =
indicators ---
commit f294324394a3b551fc4139386f0f74282d1fdb24
Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>

hwmon: chipcap2: serialize access to low/high_alarm indicators

This patch adds per-interrupt mutexes to protect low_alarm and high_alarm
accesses from threaded interrupt handlers and sysfs, fixing a potential race
condition that could lead to missed events.

Link: https://lore.kernel.org/linux-hwmon/20260625162114.417EA1F000E9@smtp.=
kernel.org/

Note: This review is provided in a free-form summary format without direct
inline patch quoting due to recitation restrictions.

[Severity: Low]
Is it correct to introduce custom per-alarm mutexes for interrupt
synchronization here? Looking at the hwmon subsystem guidelines, drivers
should use the mandated locking API via hwmon_lock(dev) and hwmon_unlock(de=
v)
instead of defining and using custom locks like low_alarm_lock and
high_alarm_lock in struct cc2_rh_alarm_info and cc2_low_interrupt().

[Severity: High]
This isn't a bug introduced by this patch, but does the threaded interrupt
handler pass the correct channel index to hwmon_notify_event()?

In cc2_low_interrupt(), hwmon_notify_event() receives CC2_CHAN_HUMIDITY
(which is 1). The hwmon core adds this to the humidity base index (1),
looking for humidity2_min_alarm.

However, the driver only registers one humidity channel (index 0), which is
created as humidity1_min_alarm. Will this cause the sysfs notification to
fail silently when an alarm fires?

[Severity: High]
This is a pre-existing issue, but is there a teardown ordering problem with
devres in cc2_probe()?

The threaded IRQs are requested via cc2_request_ready_irq() before
devm_hwmon_device_register_with_info() is called. During devres unbind,
resources are released in LIFO order, meaning the hwmon device is
unregistered and freed while the IRQs are still active.

Concurrent sysfs reads during unbind could re-enable process_irqs. If an
interrupt fires during this window, could it dereference the freed
cc2->hwmon pointer, resulting in a use-after-free?

[Severity: High]
This isn't a bug introduced by this patch, but does the driver permanently
time out on measurements if the regulator is already enabled?

In cc2_enable(), if regulator_is_enabled() returns true (e.g., for an
always-on DT regulator), the function returns 0 immediately without setting
data->process_irqs =3D true.

As a result, cc2_ready_interrupt() will ignore all interrupts, and the
measurement wait will unconditionally time out. Should data->process_irqs
be set even if the regulator is already enabled?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821-chipcap2_l=
ocks-v1-1-1d8ccabfc1b2@gmail.com?part=3D1
