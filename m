Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794365908;
	b=E44GpAdw/+kUu4OtwTj0evI8BFBxwlc+2nsrlJ7jEoAJr0NrqeyAWD2VBsJgzAOFoVlN
	 AC82jDVwZ71138paemPUMANYMF0s2dzfDV8pP5mMXvajU+BNai3WkYC8SauvjOsN29PAc
	 sbS5mHaZC4bp2BfPNrr7okl9afzOzAP5RiyFfsehgrWVCJUHs0u4tmlS31WJAi8NUWshJ
	 7j4ImfYe6tE7/GMVsJuN6OT3jmSDzPaqm+Ee55aYkugq0Od8cduSarAOfAh7Fg4ynACDL
	 A+MGsXBhwogevkyVFNHdh/coEHEIsLWYJuwPY1EWiN5GLN+QTTEwqwoazxuUZ62vwAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794365908;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Ot1nqRzv8T8zoeKQkFqPGSpwYsqpNY38UpCM6FYkYiM=;
	b=SPOYlPU10fA4sOn4w2XoeEoUKxBcCXiYFf3ql1TNL5JIT0ZQNO3Qm7g/Od8MLdbHj1wF
	 YWb3dCgiE4wUYcH1xQiOsve/aW35oBQspmM75qO/kmL0725zSy7/jg2zWE+6golFr6glT
	 v0gsSiNr+EvdD5D+29LFJ2CGzIUA9NAjOsQYWsf0YiXbePBCq1Q+Jk7v6pvskaX3CdyRY
	 Atsodu2RQJJSKm15PkHITUYpp/D92KPNKBftk54JAY3oKO4922C9kE444JLHfnD3tHG2m
	 qLrDdS4yhB9f6A0CzEp2MRi0ft39R2MpaBe2thianp5yMWFNziNUTWvEB+vDVA0kWWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QcNR0HaU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27148606A320
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 02:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QcNR0HaU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85D41F00A05;
	Wed, 11 Nov 2026 02:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794365908;
	bh=Ot1nqRzv8T8zoeKQkFqPGSpwYsqpNY38UpCM6FYkYiM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QcNR0HaUPG1fy+VA5Tqy26tlQhaaytakBcVZo8eEi46z9fwmmBeFi1iT/tR4Abmrp
	 cnOpugkPyJEkkYVARHmRfI8FX3zwEtg/caqwwrbzAxOKNhRChIlpHljVyC7HGVxDyz
	 /tZN84L/29zFZUl4EFjWnLzNomaisS3v9VL/bk4K7sQzyliUZzTvOpWP9bYpNYxpwN
	 vNskI/tVRfpsA7KCBOz49jVIG+m9MvuJOEgl/zkrSXdD6j6S2DBXiq4coAwpimE1h1
	 YsRgsAagW825CU+0Mc6+MW5pZr4cHjbrztdXPGrdR6uVPO2U8ZMeQ27Ofi10jqfCzV
	 wNFVmHgog6DJQ==
Message-ID: <sashiko-outbox-208139@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: (nct6775) Clamp voltage limits before narrowing
 and scaling
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261111023927.9234-1-zhujun2@cmss.chinamobile.com>
References: <20261111023927.9234-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 Nov 2026 02:58:27 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] hwmon: (nct6775) missing Fixes: trailer for in_to_reg() overflow
  fix
--

commit 4db65731cc107b583fd8b0467f24228d05ec41f5
Author: Zhu Jun <zhujun2@cmss.chinamobile.com>

> hwmon: (nct6775) Clamp voltage limits before narrowing and scaling
>
> store_in_reg() parses an unsigned long, but in_to_reg() takes a u32 and
> multiplies it by 100 before clamping. Large limits can therefore wrap to
> a low register value. For example, 4294967296 mV becomes zero on a
> 64-bit system.
>
> Keep the input as an unsigned long and bound it to the register range
> before scaling.
>
> Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>

[Severity: Low]
Since this fixes an integer truncation and overflow in in_to_reg(), should
it include a Fixes tag:

  Fixes: 9de2e2e84e7d ("hwmon: Driver for Nuvoton NCT6775F, NCT6776F, and N=
CT6779D")

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261111023927.9234=
-1-zhujun2@cmss.chinamobile.com?part=3D1
