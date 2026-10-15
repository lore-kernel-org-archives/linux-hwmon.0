Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D405838DC52
	for <linux-hwmon@vger.kernel.org>; Thu, 15 Oct 2026 22:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792102972; cv=none; b=ZYH73oBWexwxbzJvKBcZ4bG1CsUpMSTIQ85Znh6KQFG0AweL8aW7VqwRHswiQjcOIdpWfM3Sd6YZt06vD84ebtiphVbs+CtKAbTFKtB117Esq6ZwuYInLnQA18/U0WXOaquu9rRt9UPp7d+D5cGrz20XcLls6ZL4fAdlM10g4qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792102972; c=relaxed/simple;
	bh=7fFSA9Dvq26jVOP1HUOEkAttDsLs7N2aNmxqnf4eVLg=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=hB8qfJk8P+45WNU4KIgm6OiwdDDRu0vwxFHkcUQ4kN67E2vBZZH1H3Tcvac2V4HTSK/0m2hEtG26Cj7sCkKvRC39YLaScrW9qDkl8jITaJNv/dHRgbPBMQk3vXsB6aQeqJsWakrxgzgeSIotYsnBgcNY4jJRQX/FSiZN6+CZfLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TUnZAnfy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TUnZAnfy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39E801F000C7;
	Thu, 15 Oct 2026 22:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792102969;
	bh=7fFSA9Dvq26jVOP1HUOEkAttDsLs7N2aNmxqnf4eVLg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TUnZAnfyI53897hOLCvQgPgDCBLslAwLSGFtm+Hwnkdq0HR6g23GembsDIBMXd4te
	 uCWrKMXTX/To+eJ3VTxLMQfv8SxMnTocNTq5O+58oN2ItwrO87Mj9OhoGFU+6m1T69
	 vA4KxZBq4OBQL5iaufesVyBENGMGSDWGsvt1Lq3QS/hH/iDjQ2b522AUYR7jqVonuH
	 VcSrNOGONpzJcxOrIB0tGP+ITaFujf/5CGCpijZsWoQ6l/aFa1TfzxoLBbsCkjsNtW
	 j5p1gmMhK2lL0xQ9aD1MwG1Gc1Sa2UDqBVv0wrXWcIzPhDORvzwI5pLqV+kycJxWKH
	 nxoWMtgRsNLzg==
Message-ID: <sashiko-outbox-173447@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v4 5/6] eth: fbnic: report temperature and
 voltage alarms via hwmon
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261014222225.2803660-6-limzhineng2@gmail.com>
References: <20261014222225.2803660-1-limzhineng2@gmail.com>
 <20261014222225.2803660-6-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 22:22:48 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Firmware reports the range a sensor has entered on every threshold
> crossing, including the one back into the normal range. Expose that as
> temp1_alarm and in0_alarm, so the alarm reflects a condition the
> hardware raised and an excursion that starts and ends between two sysfs
> reads is still caught. Each crossing wakes anything polling the
> attribute through hwmon_notify_event().
>=20
> Each alarm is only visible if all of its thresholds are reported by the
> firmware. Voltage has no crit threshold, only min and max.
>=20
> Firmware only reports a range when it changes, so a sensor already out of
> range when the driver attaches has nothing cached. The first alarm read
> resolves that via a sensor read, its response carrying the range.
> Old firmware that doesn't report a range leaves the alarm to be
> classified from the reading against the thresholds, with no range to
> notify on.
>=20
> fbnic_hwmon_notify_event() runs from the mailbox IRQ, so it can race
> registration and teardown. Publish fbd->hwmon with WRITE_ONCE() only
> after a successful registration, clear it with WRITE_ONCE(NULL) followed
> by synchronize_irq() to drain any in-flight handler, and skip the
> notification when the read returns NULL.
>=20
> Signed-off-by: Zinc Lim <limzhineng2@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261014222225.2803=
660-1-limzhineng2@gmail.com?part=3D5

