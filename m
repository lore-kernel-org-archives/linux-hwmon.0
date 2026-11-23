Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431874;
	b=Q6zEcGHd4HPB9AZr/yNZZHtGUFnE0amIsedYCP1wamNp3HWVOpc6nmRe6NdAS3ruIhN6
	 ilfnnoXvaM69SbPj3jmefJVx4hGjQR6PdVpx+EYLst44sggMj+6772VTBPjeZnQMfJOze
	 pjIR8+S/lGiE9rzawqq7wcFDsStUaGei9ns64iAQZ4AiletxkcMAKjCSnI8FskNvDQMTV
	 RofiV1pXpYof7yqWJ4RxHMxDKrp5vo/ZYnHbPC0puCaO7SoeDfWIayFmbnAeg3YJf91+d
	 0G8ADwIYFoxxiE2q6KairtT4X7qerTFTmJyXxsK+CK9R/GE/Vj8NUeEiTCx+mzAEnew==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431874;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=91DVQwqwWmmq/e4E/DteO+j/74pQosrExLLhdRYN5qc=;
	b=aT/X0rG016MKD7Gtar6k2lB3c51mtchWVhLYGmhTKvB2gKjveJaCBtzAFJm3GxB7jLUp
	 7V06zoVrnNN/D3bHXVEpYwkEN+4QsLVcENLS/0dHhWJrJyvJhlGNEjLAQdWGk8D32KEUw
	 IdCX5m4FvQXziVFpaFyJVI3RUqfqmHJHfzlryceAQ7a6kOlSWVlhfBhpECROdmOHhMBiA
	 PhJ644AOoNW+p0wIxquhaio3j5lbhikmgOceqItQOdVK/hSPFTeskSAnmDVMj7R2H7UBX
	 Z9evoj3LIYQTU9jf1a+V48B4zMa9yHi+aYmsa/dL21oizBuiNgVliaV0VqrgGi1iK5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nVD5aOTF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4489E606A68E
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 11:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nVD5aOTF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B3F81F000D1;
	Mon, 23 Nov 2026 11:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795431873;
	bh=91DVQwqwWmmq/e4E/DteO+j/74pQosrExLLhdRYN5qc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nVD5aOTF+J+Qlf0KyaaVMF/edvKH/5Em5lwFTwnRvFt/dCbH2/m0rNk2z3++BOfXx
	 GIocImpy7swy0BVJKDu/qr9/XRAEWb2xjJWoTxYdiftNek4B8LJqg+7WY1dbnU0twQ
	 Rz3tmi0uA8crJ/rA0n/R6oqSY1pfomYAE+witI8Gsydu2k9eg0HaYDgfXvAqAjpe4n
	 232LSTpCJq3Tv8Jb45IrTK8Atb/KO2mVIafbSYw0FNPcJjytIYJeGzrfqpAmxzlC+C
	 cW9+lhXr46xU7nrgw4GR9A783lR7i3BaU+djeqo+orcvKhutFmvjkB+o4R38L5cqO5
	 CnTH1dCwzkO5g==
Message-ID: <sashiko-outbox-229095@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/3] platform/x86: dasharo-acpi: Add fan control
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?RmlsaXAgR2/FgmHFmw==?= <filip.golas@3mdeb.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261123105821.305527-1-filip.golas@3mdeb.com>
References: <20261123105821.305527-1-filip.golas@3mdeb.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 11:04:33 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 3-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123105821.3055=
27-1-filip.golas@3mdeb.com
