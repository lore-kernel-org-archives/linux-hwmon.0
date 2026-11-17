Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794959143;
	b=5fjwU6/AMGNMH6DzILNe/QSEyVuwhe5YwQu5WN9u0pQZK07IgYZluYQiICFZoNeLQUYT
	 /y3M5E1+KtW1wA41s5yHDHeTxn5DRwqA8WQVjxxWUGVv9W2xdA7j2LGChzFe+tOzWzsf4
	 NaJ+KGYqHsQbwBBnhUz/aeIZoa0FJcPGpsSMtEoXbGo8+wfOfwTFZd6C82CGWXA0Z19I7
	 IjNNBdGbrzWGmnfMc2bTYfP7Gs9NTQY6QXZIBuxGd0kn8DClTA/RO+ZO0j+kjYCMJqlDw
	 bLikrZ30xmm/0Va4YC16gj1+Um2XMDIB+CE/RrmQnGmDBp6oexOfw9eSqLQqO9MNNGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794959143;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=n9KwBFmmtPhkeQlCoCHBtvXq5XHjiKV/m251tChWjSM=;
	b=hdhVnB1oAv9tSMzNqxyu4zV2XamP01e+ssnJgY6eF9V+pzSqbtHANQalXGD261+91ykG
	 sBUMadmueaaKuAwOFsvMmqwumsCl/3TdepgcW83J+xpDYs37GIFmw6VbVBtkdWu/9gM0h
	 nSZxeY8qwhzvgnANeSBHj0Da2wyedEHhURnJEKWdWXGuN0dae8PZb6L8oLszTr/9vNlZc
	 o3HyqHFmr6CHDA56NtEasxD1NpOZGgwl2O5vajrH4S+2P79jR/TXlFJCkCT+ZRXYRXoa8
	 bVluhPWccH61Y9LhUXh2O1wOFAlAXYyXVhz4Dj33tlldt5H/rYzKk2MKLoiczd5YVzg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gGLSt6AS;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C011606A32A;
	Tue, 17 Nov 2026 23:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gGLSt6AS
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794959142;
	b=CWpaYby7AjWC+F0RmX7GnAN96b1aevgCsmyBHPjtQiIIALZC9T8k4B868YKwP5Ji7Sp/
	 cgUspO+qjH26Ens17dac19fGoQpwIPbX2fshG03jKe04gQ5/qRL4PMXtTNuVQKwucbQtC
	 eFFaptMMc3gnsPUb/LM/mgUeahvn4CV3NtCBXzdiGYdCQrv5ofZ1Jy/1Ycjt9mbBjYT/N
	 ErUZ087pR7Avscb4hZ3I7X9q+jPubRUax+vKMJdwSvZS0UCQ0p7DDeGSjmN8ByaPa7NoF
	 gi/SuT3vzEXn6Hv2Mx5JEbiRI4qCWpZAMVTk4dvT9wE+Ag2IxfpZ0sN65mVI2t4syCg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794959142;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=n9KwBFmmtPhkeQlCoCHBtvXq5XHjiKV/m251tChWjSM=;
	b=FitWRf3Si5H25t+Ibw1ymHwBNOcpQPHDvE9G5qdlRL1p2oqIGMJ0sJFfBMzXHyBF586H
	 FbVo7kWHXcaiRwSXar3xFJP8JDGtWItZpJd+MsJawrzwSsyhOcV/6AASpKdk+GbpuSUgY
	 gRyI/Qi+umEEeizr+aNB0D4f4mIewAsw+DEe5I6JTZP1dxxe6mpVgFLEi+H+U7VF7fC4X
	 N/ejO75kxhEti39h1+lLy9WcWSf+4ye9D5V31Rh2wk/bXD74GG647eYm2g7vkSVqo5Iuw
	 7x/MEkV85g101j5prYZhZG0lBjYxwEqE/CmBG7GaiMvj1sVIgRtjmjMk/yPPWRqIG1g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F05231F000C5;
	Tue, 17 Nov 2026 23:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794959142;
	bh=n9KwBFmmtPhkeQlCoCHBtvXq5XHjiKV/m251tChWjSM=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=gGLSt6ASL9esoVSzfVR/FTgRSpy59pOKJwDwg2Dp6ncrFdCzBfDbesRTNbTN+1wJc
	 YLr6OzKHQW635gNXW+V/l7ydndtkLLWMazE4ueaOYLuSpGpDYOZWvOAOxrOS2v2RnI
	 OGmqxpJpVKD3UiUSVQzQqZOuxndaGRB3PSPWWLYdHjW+dc4HA1z9n34nHLckpKRXDK
	 gMk0Hah4kHzo42zKAYgNoCxjZR4OPTUHqKf7B6DA6kgVwtdnmOLWhLhrT6EcsSTt3k
	 mMmdvMoizjROLwDOF6qdwK5M4Me4Z69GmGqb3x2IHk7yQsqGDxNZ3z8l6IQ4LU4TYG
	 0vUiaaRE8pmGg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4D03F4AB5A;
	Tue, 17 Nov 2026 23:45:41 +0000 (UTC)
From: Luna Hart via B4 Relay <devnull+lhart.opensource.witekio.com@kernel.org>
Subject: [PATCH v2 0/2] hwmon: Add support for TI TPS389006/TPS389008
Date: Tue, 17 Nov 2026 15:45:34 -0800
Message-Id: <20261117-lhart-dev-tps38900x-v2-0-e5730523d3ee@witekio.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAB7n/GoC/32NQQ6CMBBFr0Jm7ZihUKGsvIdhAaXIRKWkbSqGc
 HcrB3D5XvLf38Abx8ZDk23gTGTPdk4gThnoqZvvBnlIDILEhZRQ+Jw6F3AwEcPii1oRrTiqQvR
 66EuSFaTl4szI61G9tYkn9sG6z3ES85/934s5ElZUSi1rVeZSXN8czIPtWdsXtPu+fwGJt0Nku
 AAAAA==
X-Change-ID: 20260929-lhart-dev-tps38900x-f932bcdb4057
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Flaviu Nistor <flaviu.nistor@gmail.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 Luna Hart <lhart.opensource@witekio.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794959140; l=3091;
 i=lhart.opensource@witekio.com; s=20260928; h=from:subject:message-id;
 bh=ub3rQB1hEVUcxmYwPcTpjMDC14MRxWhQm8aPzhcMGKQ=;
 b=B0wPX6eZkboYZTGtpv+4lOEOawfyeSbhO4MbEAGM3CqhIBb+avKeyH6bwIXUqCPUnBS0R1V9Z
 PtP4Lt5wV9UBUZvlkYElifUv54I9yTF6YGCJivvZaJssmHRyhfJ/068
X-Developer-Key: i=lhart.opensource@witekio.com; a=ed25519;
 pk=Dm1WPzsg+HuKn11WChbCWrNOk7GD980BnpCdnUwyDuU=
X-Endpoint-Received: by B4 Relay for lhart.opensource@witekio.com/20260928
 with auth_id=1079
X-Original-From: Luna Hart <lhart.opensource@witekio.com>
Reply-To: lhart.opensource@witekio.com

This series adds a devicetree binding and a hwmon driver for the TI
TPS389006 and TPS389008 I2C voltage supervisors and monitors, with 6 and
8 channels.

The driver reports the voltage measured by the ADC of each channel, and
can enable or disable the monitoring of a channel. The devicetree can
select the voltage range (1x or 4x) of each channel. Otherwise, the
power on state for the scale is used (likely OTP values).

This v2 patch set addresses v1 review comments, and handles parts with
an OTP configuration. There is no single register to indicate if a
channel or chip uses custom OTP values. Thus we assume any OTP
programmable register to have a deliberately set value. We have taken
care to preserve the init state of channels based on the value of
their monitor enable register. Triggering a fault by modifying channel
settings with monitoring enabled may have additional consequences
depending on the hardware layout.

Tested on a TI J784S4 based board with a TPS389006, on a 7.3 based
kernel.

Signed-off-by: Luna Hart <lhart.opensource@witekio.com>
---
Changes in v2:
- Drop the TPS389004, no datasheet or part listing could be found for it
- dt-bindings: rename the file to ti,tps389006.yaml and vmon@N to channel@N
- dt-bindings: child nodes no longer select the channels, unconnected
  inputs are marked with status = "disabled"
- dt-bindings: replace ti,4x-scaling with ti,vrange-multiplier = <1|4>,
  absent keeps the range programmed in the chip
- dt-bindings: document NIRQ and the MON1-MON8 numbering, drop redundant
  descriptions
- dt-bindings: no fallback compatible, the parts differ in channel count
- hwmon: fix the VRANGE_MULT address, it is in bank 1 (0x11f)
- hwmon: never change the range of a channel that is monitoring at probe,
  and respect the configuration write protection
- hwmon: return -ENODATA while the ACT pin is low
- hwmon: fail probe when no match data is found (GENMASK(-1, 0))
- hwmon: cleanups: use the regmap cache instead of a local copy, drop
  <linux/mod_devicetable.h>, "{ }" terminators, /* */ comments,
  devm_kzalloc_obj(), channel counts in Kconfig, sorted Kconfig/Makefile
- Link to v1: https://lore.kernel.org/r/20260929-lhart-dev-tps38900x-v1-0-7045c5894152@witekio.com

---
Luna Hart (2):
      dt-bindings: hwmon: Add TI TPS389006/TPS389008
      hwmon: (tps38900x) Add driver for TI TPS389006/TPS389008

 .../devicetree/bindings/hwmon/ti,tps389006.yaml    | 114 +++++++
 Documentation/hwmon/index.rst                      |   1 +
 Documentation/hwmon/tps38900x.rst                  |  80 +++++
 MAINTAINERS                                        |   8 +
 drivers/hwmon/Kconfig                              |  12 +
 drivers/hwmon/Makefile                             |   1 +
 drivers/hwmon/tps38900x.c                          | 361 +++++++++++++++++++++
 7 files changed, 577 insertions(+)
---
base-commit: 28c252b708a9d223192cbf848d320cf6d0f7ed3a
change-id: 20260929-lhart-dev-tps38900x-f932bcdb4057

Best regards,
-- 
Luna Hart <lhart.opensource@witekio.com>


