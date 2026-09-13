Received: from outbound.mr.icloud.com (mr-2006i-snip4-6.eps.apple.com [57.103.70.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6C4390212
	for <linux-hwmon@vger.kernel.org>; Sun, 13 Sep 2026 23:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.70.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789341256; cv=none; b=GdckXVlOu/82CiiXQndujhN1yA0kUa37gMqsFwtrbxdBS0xHbwrSVCg82foOVxfe10cE9OGgzQsbY/ysJjb2iRRl42/zYq/SmZ9PAd/1NF2TI2eV8goyhKJCoXj0su+VMgx+lTefe7cNfx3ke5EgkRultsaIKE7l9q6CANBfwig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789341256; c=relaxed/simple;
	bh=0w47cWUOjkjFVtCMkAXNm3YPC6TP2IV9Iyn3Wincu0I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZFI2fcuM3usN3aK7zp9ldR6oCkG62lUqzpLf2kfI91Bt8eQdIXkOGwIL47GqMRQD9vlm1X/hh7N6adjNcxITdapFjzEndA3MPVZEvF50N5BKhFeh7ENVwR/AfpyOCyKIS9G0E59ee7mN95bfYi7XSMCkVYuoJd/+tXh9zH1332o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brough.org; spf=pass smtp.mailfrom=brough.org; dkim=pass (2048-bit key) header.d=brough.org header.i=@brough.org header.b=Jm+laVyA; arc=none smtp.client-ip=57.103.70.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brough.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brough.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brough.org header.i=@brough.org header.b="Jm+laVyA"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-7 (Postfix) with ESMTPS id 0D82918002B7;
	Sun, 13 Sep 2026 23:14:11 +0000 (UTC)
X-ICL-RepId: 01a09d0c-b98e-75c2-9447-ad0a1fe23170
X-ICL-Out-Info: HUtFAUMHWwJACUgBTUQeDx5WFlZNRAJCTQhLBUMEXRxIDlYCWwdLVxQEElwfUwpcMFsKXBhQAxwfSx8TC1NWUAJWDVQFGQRAFxkKUFAGWxIYXBRcUFgeRhJWDV0JGQZAXlAbXwJCDxwTVhUTHUMZDysISgRDB0UCXgslEwlTVlACVg1UBRkEQBcZFVoJClcAQAtOA1QGWABDCEwCXRlfA0YASgFABkZYH0scUgN3CUAfTB9bQ1gZVU4ZDEodUlZRBUoMXABoD10dWBFd
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brough.org; s=sig1; t=1789341253; x=1791933253; bh=J90IzbEPfYJ8bEa5LbJgDVVfJhUcZZuy0uPDYDbmzAM=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=Jm+laVyAyQXdlwLlqUM1cVoBHTWJ9nc9U1yOcHZvMBNOxK8o9kSvkKvetTfsYWsUIEjY6xp0tO9S1zNlxILI49AKFlImK2x13PlPFzVkwi0FyQ3N27FgcE909HbFtl6wsbVi14BvIN4InN1J0GaJkAV56QcV2zsLWBLMquJJa3/RKSkV6N3olCuGYqLVnegPkBymXVF7o54SYnYXvrigxgtnEdB006/Xqo6DHaaj0mFkU4aNWPBUEW4Lc2eHLYXyNt2YLk63iA+HnGdD91WPQthwqpC4O7FYljDZwyyENmL77bzrA5pytIoZ5/V+5sIDVdfzyK8aoASRIEtB5ts4bA==
mail-alias-created-date: 1646594351620
Received: from jb-desktop (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-7 (Postfix) with ESMTPSA id 3D60618002AB;
	Sun, 13 Sep 2026 23:14:11 +0000 (UTC)
From: Jordan Brough <jordan@brough.org>
To: rafael@kernel.org,
	rydberg@bitmath.org,
	linux@roeck-us.net
Cc: lenb@kernel.org,
	maciej.wieczor-retman@intel.com,
	pawel.chmielewski@intel.com,
	linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] hwmon: (applesmc) add native charge_control_end_threshold support
Date: Sun, 13 Sep 2026 17:14:08 -0600
Message-ID: <20260913231410.416922-1-jordan@brough.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: nJgR6IQ5KyDnnnKVBLRtVM350I-SXSJI
X-Proofpoint-GUID: nJgR6IQ5KyDnnnKVBLRtVM350I-SXSJI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMzMyBTYWx0ZWRfX8cYpuD6ScL/f
 snL87QLxhgK1wnP4bIDv7dAcVeIIifeSX483Go2Iy0SeueqN7oLhCXSBsLBTVP6K4eqAs40imVd
 uuzcMELoB00zAS3ODpWlh+yZ8AX45C0sdwyOihV7SizofM+EekdQtl9u8Q7KDSQW4zUvg+IQ6dm
 quMjUmOoaBY4/da+00kCYc1V/wCFwTrnAn85kfbZoliKtXX4wybBN+8on5PjMqp/u01B/x9wBRd
 qdynuf7DwiVUWQAjGUTAAeOh3PIkoM3t9NNh5mD/SFyBexMAQGIVRYuFyqEA8fnyfb5xK64hw6W
 uBZRU7cjbXfgAHaPHlGTWFuvwVO4DgikfK83tEELnIpL4qslSBV0XHWLm/We4g=
X-Authority-Info-Out: v=2.4 cv=Dbcaa/tW c=1 sm=1 tr=0 ts=6aa72e44
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=OLL_FvSJAAAA:8 a=F4DE6m3_W9dUK6_cFgAA:9 a=oIrB72frpwYPwTMnlWqB:22
X-JNJ: AAAAAAABypms+LpuPwTaFByt30ldGBs8UXgNHIB+x0F2QVRTJv3Xq2sKXF9tRm12SORDSp+9MuxbzdLehHePj45A2L2uuwqgr625lON5Xu6EpZ0vNF4VROztUHnrOKJvCgb9c+zinGYOfGpl3r7iU2n2d+Ev7QBEkcYWWAohZ9ykkzTXSdyf49pLm1e1zaXt8t/WcisRvOfp/yK1EWEwGRVnA4LAII0YGaKD9DTzb57UZO6/oFN4nEPV5gwj0u6buNsRWUh5nGG3r78WqbWID5EO7JsN+/ti1N6ZimZWljpao70yFVteRt2d1G3OycCVg+ppWM1KpeNuBDA3iMxhBaJYI+bczV59vLt2Bzs+5auxS3+ydcEYtmZ/h5fA4nAwNP3+XlF7lByKetP0jX6zL10wNhW2BtUxbGFmeSXnXKjZWMTkAgqo8CpDek9YNb32c/lxM0CK81Hdg/mUHvQRIpzUyLhFd6kF6BBrU/XrClgH2vmqIxXcOGNDbYq8oiwCjkKujfzbb3byN7rlvGQuMOic944zAvknoIviOgMdbL/DLVzGi7xW1Lm1aweGa2PrwzOQKk3mWD/MeCbClnmF8G+zQJliWHTP8UTd+W2+JKfmm7V/N0M+qAHYD8ZfUvySk8L94QuqZToGLETC1fZFN6/PU1X3rzPNuxm3Lkkv8T7kbIDRGcVDYYg74kH+bogH+f5e8Oedv/PGIvEhTv/24N4Uc4wrACdTyzAJKMAT7LCUz14XWeaLK2jpJYqjmzq7iEcrixcF1F2EbuZRgxvDNmvCZ6Oso6smkUOVAH3pWGldkKMWpvSgm8cygbGp1/uD92RN0dxhuoDX+X6/NBvt6+c1dY7ApgUVRXvfqv1a7YMAJ6oR09rHTHgm5YR5u7YHU3WcCOLyVdXbVo0V/fnmQAwuDra/brWjpv8hOdrsecA/cgaJP1rs47LeQ+A7bwT+N/sqZd1coAaqngTYHzJHhsDecfqjsqh
 9qEkvF3OPjhrG4RqWMridK6mvlNE041q/YWzyjXyohSjaYgmDz7+f3wi2Pm94dh9JHN4kPuKpddC+TXI7PL5YUZDOv8sBFmRbl8DAZa3oXG8CmCZzXuIbDFEu4NEP14H2P1NNRZQ1am6xwZZvhf87HfT92Pjbhy74iIHyDYaAJs01leYlOFQlcS+4v7FjyoLsOBHczr7bzOem4eEN3VRQZQ7l366/xYukFYQbMsxo2xoK6zWnIGNhelyd7l+MmKxtIiWlQDxJQ3ghfDrTpNEybF11agbbRKn6+EM0KkQn31BDETxpaCUbqdY9eFD5x6VF1FhFO/3j4yszsuzVJQJvq+hPrPB9jCoCG72HDAEdc9XA31wlh0jyKg4sACHzofB/3CwtfScFM1FGUnwx9CcGeH9SDq0Z3B5mZ80uDVajkU2xqY4=

This series adds native charge-limit support to applesmc, so that
generic userspace (UPower, KDE Powerdevil, GNOME Settings) can read
and write a MacBook's charging cutoff through the standard
charge_control_end_threshold sysfs attribute, with no vendor-specific
userspace daemon required.

Patch 1 is a prerequisite: some Macs register their battery through
the ACPI Smart Battery System driver (drivers/acpi/sbs.c) rather than
the ACPI Control Method Battery driver, which is the only one with an
existing hook mechanism for attaching extra power_supply properties.
Patch 1 adds a parallel, purely additive hook mechanism to sbs.c so
patch 2 can support both registration paths symmetrically.

Patch 2 adds the actual charge_control_end_threshold support to
applesmc, using the real SMC BCLM key (not the cosmetic BFCL key,
which only controls the MagSafe LED color and does not affect
charging behavior).

Tested on a MacBookAir6,2 (SBS-registered battery): sysfs attribute
appears, reads/writes round-trip correctly to the real SMC BCLM key,
and this was verified end-to-end through KDE's charge-limit slider
writing directly to sysfs. Also tested on a non-Mac laptop (CmBatt-
registered battery, no BCLM key) to confirm both new hook
registrations are true no-ops there, with no new sysfs attributes and
no behavioral change.

This was previously discussed on this list in 2020, proposed as a
generic sysfs interface for reading/writing arbitrary SMC keys by
name. Guenter raised concerns at the time about that approach adding
non-standard code to the driver:

  Link: https://www.spinics.net/lists/linux-hwmon/msg09839.html

This series takes a different approach: it exposes only the specific,
well-understood BCLM key through the standard power_supply_ext
charge_control_end_threshold property, rather than a generic raw-key
interface, and gates it at runtime on a probe of that specific key so
it stays inert on any hardware that doesn't implement it.

This is my first kernel submission; I'd welcome any correction on
process or style along with the technical review.

Jordan Brough (2):
  ACPI: sbs: add battery hook mechanism for SBS-registered batteries
  hwmon: (applesmc) add charge_control_end_threshold support

 drivers/acpi/sbs.c       | 147 ++++++++++++++++++++++++++++++++++-
 drivers/hwmon/applesmc.c | 164 +++++++++++++++++++++++++++++++++++++--
 include/acpi/battery.h   |  16 ++++
 3 files changed, 321 insertions(+), 6 deletions(-)


base-commit: fd73f4a6659897191fa0d40695fe370925dd3780
-- 
2.55.0

