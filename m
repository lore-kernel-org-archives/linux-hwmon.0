Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 317E3368968
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Apr 2026 19:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776886325; cv=none; b=K9eObhk6xoMGad8EBgt9D9n9b669WkTdCEqMruT13vcZMK2wt0sctY1rcFvZ7PK31wMJ6sKSUJu9JcHCTW9MrpRFOtMmy1b3aXbrsfoSmbRI78sWgVHI8XTjpE22aTcT86uJnhDCPgQgwfz/T7Nr5v7RDa0s9voiia+r6VnxVRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776886325; c=relaxed/simple;
	bh=qNqdwSdH6zLO2FlhNm7DQG7QwAxsj0NvQQ/ESML4/yE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pkuonV51jGfXEvvxOJZoAHThvAXlZi2IfShYvbDxsLei+gGDAJrYlQBOtIjeiMzw0EPOwJK5Tul9qi23ELPST1EnD3tKjiGVq4WObfa1y07bC0hG4IRD8QrY7hcTotK3DKtHD6CBsfL7BUXb1gUcKE2514zAVMT/v3qWb5pFjgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JCoZ3TCh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JCoZ3TCh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9186C19425;
	Wed, 22 Apr 2026 19:32:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776886325;
	bh=qNqdwSdH6zLO2FlhNm7DQG7QwAxsj0NvQQ/ESML4/yE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=JCoZ3TChoIevifGKoiwBTg5cnKK/YjZ2p/Bn9K8cFjkwa6QvPiytAR/D/k7a3DKdL
	 hqMYpsQCWQrj59qqsM1WjjPX3UArLkDe1NA8EPA7Jfw1AOBQwTTXx5/hFkvIE1ceau
	 LPfKe4RXhAYDEv/dtveqGFWcYg4gvOEuuv6BeT7O35yzLl63iHM/kWN3+ADuxqeI/I
	 RnlHQaS4oD2nX2PHFqUq+MnDdSawy2D8xkYCNliStkrU4x2Nu8CtcGELYJZWdbhadi
	 2xMfr0zvYdzOulFfq5X9NPwa91AwyKHzB53vjwZpxrFQOyWIVvre6R6FamnRhsbfYE
	 ZCvi9LjS6FfUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] hwmon: (pmbus/q54sj108a2) Add support for
 q50sn12072 and q54sn120a1
Reply-To: sashiko@lists.linux.dev
To: "Brian Chiang" <chiang.brian@inventec.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260422-add-support-for-q50sn12072-and-q54sn120a1-v5-2-b8fb87262868@inventec.com>
References: <20260422-add-support-for-q50sn12072-and-q54sn120a1-v5-2-b8fb87262868@inventec.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Apr 2026 19:32:04 +0000
Message-Id: <20260422193204.E9186C19425@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 1 potential issue(s):
- [High] Unprotected multi-step I2C accesses in debugfs attributes violate =
hwmon locking rules and risk hardware state corruption.
--

Note: The format of this report has been altered to provide a free-form
summary of the findings without directly quoting the original patch code,
due to text recitation restrictions.

commit 2b69d94c9e5ce34bab27d73e893934ef3b3cab81
Author: Jack Cheng <cheng.jackhy@inventec.com>
Subject: hwmon: (pmbus/q54sj108a2) Add support for q50sn12072 and q54sn120a1

This commit adds support for the Delta Q50SN12072 and Q54SN120A1 power
modules to the existing q54sj108a2 PMBus driver.

While reviewing the debugfs attribute setup extended in this patch, a
potential locking issue in the underlying driver logic was noticed.

According to the hardware monitoring subsystem guidelines, drivers must
implement locking for attributes registered outside the core API, such as
debugfs, to serialize i2c accesses with standard sysfs operations.

Looking at the implementation of q54sj108a2_debugfs_write(), it performs
multi-step i2c transactions without acquiring hwmon_lock(). For example,
when executing operations to store default configurations, it disables write
protection, writes a flash key, and then sends the store command.

Because the subsystem core lock is not held, could concurrent telemetry
polling from standard hwmon sysfs files interleave i2c operations within
this sensitive sequence?

If these transactions are interleaved, is there a risk of breaking the flash
unlock sequence and corrupting the power supply's non-volatile memory or
internal state machine?

Although this patch did not introduce the original debugfs write function,
it conditionally enables these debugfs attributes for specific chips without
addressing the missing serialization. Would it be possible to add the
necessary locking to the debugfs read and write handlers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260422-add-suppor=
t-for-q50sn12072-and-q54sn120a1-v5-0-b8fb87262868@inventec.com?part=3D2
