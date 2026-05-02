Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2808283FE6
	for <linux-hwmon@vger.kernel.org>; Sat,  2 May 2026 09:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777715138; cv=none; b=delYmqvUC1pJQQPI8vkmqWDDLVyQUKqcRyB82Jru/nkdbUUmc9U+2ilfoblzAJfQgcrfFYj9oD2bYlHCmC5E3LkqtGd8I7Ig/CFQ0NUifFhYPvwyBHIx+geWo3d/44/8UeSXT+7f9VCGv7s/y0OYpzJhG6RmPsbmxR8fe/9ZEoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777715138; c=relaxed/simple;
	bh=DlIGekRcTHWjWS8V2jaREl14+4ehnUt0/+GFfZczcJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qAHT9L+QHxkEuxeWsXpxSVssuWEjG/Sm8bwG2HDvachHm/hYlgxs6gPPADfi8HgPZNsT2TFOwPx1Fzlu10r5JFJd5FfSn/6yz2axu66HUpPnj4SL9fTlm1Eq4OKlL3Bz8FhHweDM09PBFwHzpCIg0rhfubW9Put5lPMUclh19q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b=mE0Tj1/g; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=markus.stockhausen@gmx.de header.b="mE0Tj1/g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1777715134; x=1778319934;
	i=markus.stockhausen@gmx.de;
	bh=ofQQJP4qOvdIuJ2q1WGQs3MCab1j0JByk42rfNBC6Y8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=mE0Tj1/gMz299zBMFLY5+EESO85GE7gtnbRiBzDJ+ndtdwcQbeojFQ6oXC8HdXgg
	 zhhKmx/sden08N61BnO3D4dcf5jj7S4cIt5HWSt9OuRk6lFuBl8y1xH3nKi6U8QnI
	 sGhdDbbvhaI8C6IoRXNL9DuK2PpRnQ7Thxtov2XQ8ht1EImIK8Pyyymry1MSPkUwG
	 CANWB+LR/VE0f9ZVntmuwWrlolsolkVNjolW0LL6sZ2tKprssS4usdOsOlElmxuK7
	 +8lrdsnC8vHo0NuZKdTw1zbjm7722a4dkXJ2270no/FlG/ic5fuujQ4do2yzkBYKA
	 qyqAhspiAuAfLkZe3w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MRmjq-1vvQyy1mB8-00MSct; Sat, 02
 May 2026 11:45:34 +0200
From: Markus Stockhausen <markus.stockhausen@gmx.de>
To: linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	wsa+renesas@sang-engineering.com,
	alkuor@gmail.com
Cc: Markus Stockhausen <markus.stockhausen@gmx.de>
Subject: [PATCH 1/2] hwmon: (lm75) Fix AS6200 setup and alarm handling
Date: Sat,  2 May 2026 11:45:23 +0200
Message-ID: <20260502094524.3358193-2-markus.stockhausen@gmx.de>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502094524.3358193-1-markus.stockhausen@gmx.de>
References: <20260502094524.3358193-1-markus.stockhausen@gmx.de>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CDY3KAnT67t1lDe516FzAOvAaXqBqNF5Stfp39b4bgkUMzac1yp
 3V2M1FhCywPFpO2ZVxV+hdiYiLOt+z7gRF2ILg117yQCgViSICmmSPC5cLaKRBqp/RFKvVU
 iCsUmd64NG22c2x1nHt/Y9wev+k6ouAdUCmqABlz4epI3BQ41UPFQRID0HlnZw0R5ampdoD
 FBeU7pjzTz6PR8fk9C9vw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:WvRCma72WwY=;Qzik+mblYa5Hz0ao2IS+FGHN8CD
 TsJeXXQ+YxI2ctob/1bH+xWEV1CgoClyHxxsz/+l0mh7hpxO+q91jdsRhXgqbZx09K5rCUEjY
 0CsgSSQiZ+n6FoT5C2BPROHfxQ1EWb9xzjwosN4amh8JwwhotAxo74IyoSbNOiIqL6PzbWKXl
 MEdSuiw36xyWXdugGSLHzj+LH5ytKRPe9s4Ad6cUx6qqpGJOGY8DGlGn5V069tvPNN3sXYnqv
 xlfy/LEe/6ANfSx1F+QvoGrhxIFskjNAsOnQAnifLe0jO32L30E7nd/gYM6cII6ayr1PV7G26
 CShBAcSMFBr90WprbDl65AntE2Xfg9+GUl4cNcoHUADJk2JXZmDyZKR70/ElHh41BPpReJxJ6
 0/UwAeCVRGzRvegE9getd43xsHXLHPgTOzSUfgO7tZSNGikRok8YLg0D/tXF5eADZ5Fx2v/g7
 ba1TIYbXH/Be/eKEt4rLhqHADtHpfroSeeCy+Aq785Yx+Bdyn9NzT00Oq3N56kF+u2BcyQ3Kv
 KibpzADjQFCOpippHbDVkoPzNUKvmaawY6pYDDwXthqcqiN5GBjRHuw4V6PV0UY9E2FR9bM+V
 +pO/9ECkJ0iXcvYDnuBb1iBmgKC9lbdb2InHE/5Haboio/mPqUZkKBHj9oQ1Q9SWNMYG4Pglb
 pKjUwdrcd3f0c40X7skDKH+oMGN8SgXTf9bQT4klCMflGLVFaK/vMWMT8P/R6cPtSYPK6qH9L
 6g53cZBrG4i8cq9Qc/ojkFb14BC6k/rQW/MWrip5kVRd/ioZeNTAjY/yuvT1Bp5VIZlchtfyt
 tIeXJM0tDjQYbMV+wJwJFi1pnxxArW6wgF3I0aQeMgC15MPA4x9V7Nxlll6EDK0xPopCWLIwj
 2JfPpG8vxlbNWz8PP5HuF9/z+cbTCVjyecW2EgsZVLQ8ia0kw1rC6suil0vQy3Fy+iB+NJ0Rz
 fAJxPetd8Ald/oVmEBY9e+VqJiJNSoQEt1q/sSrX56Bs7Ck96hQ4s4vnaMK6QYgYMwFwq94AY
 fkN1G5XwB2uKn41zE9GcrAxBxptZRYP1HX6HynOiZ/XDtb08zOAaX7EEq8iv5ROrsORCscoTt
 4JvGWBMGzCNaKSdr95f2jH2IDKpHB31h9gat5+oiyXeqSZsKG3rkJj/8LJMbzk+1wJDvAwdH8
 pdG4PZ88y+o9hpu5Ph7GPp7gP9TK/9UNq0cHtWrEEkT2JDBjf7IudPgQeEPTESMrnFLHyAKyB
 Qsf6wT3R9NE3+5ao5mOlay2lLVksbjODkrm2nYsNhNu8UUHRdJoqMX287/f2JJImNLl3Pf5c5
 oNey0gEPLLEm1m705mqdT8BGI2hNFmHbRmOywevLAsoKpLqD2sOvP+Rr9BQKp3Na5yTrpn7bv
 KinObNcqWFZ5Mdbp+o+0U3u5hdW2uw9AYiJ4r/DH1PsMJ27nlk4uSU7fhQzTuTkIxpXsNMeCo
 3mXd0NjLA19GH9mcF5PByJR4VFj4o0yoU730bqm6CnLL5Yst0VJNgv4HsNyBTMwupYe8rGMeQ
 eH0TJnTG2qhPiRLzgnYrWVOdHcqsCRuvuAqC8RqgD+VRHR7zBcycsgdTzWBmUarqIA9HLxAaC
 SqdMW5xk0YS4A2kyJ6NwA1wxetGjnG2RDvfxTbFj9/b5OdJmmX0AN/RJ3DHbAaylBMMqAXjHL
 /I0tMWxiGx9khJgaBPz000YA7/GoNMl3XK3lhKcvlb9IlSPix1dn+wjNqm18I02O2iBXj0ZUE
 AEdL/kFqfyXrC75Kdn+upzi+x5owmQs99D11MIIJTCcgreDjsi3K2+AL37ljuaRLBapXa8Rys
 GTdKlTEilAzMb8hCw2/BAtU63XHmca1LSHVL/8N17CJO3Q/Ga8fBTfyoyV9nZAPbO18M6TT2v
 WXYmRPZmTPME7imKmesaaP2VcOurqnIlowOIO8GkrkYZCR5OiXKd7BaWFao+8J8dnHc2XyM6K
 UO0g1HNFaHA8VqRBTLXWZAxCizDCRNCPCARsRkF1eztBNWPLmGw/1UhfLgqyAebsSNZ9mxbwg
 jpLtJ5VI6qsNSkpOMSTJKeVQ7p00QL+XqN9Z9ZCK09xMSk6eYXTYmK5U7qvOUmdeyGx45rFx+
 0ZRdpnTTlEWXlPQhtNkb5BCVLzVD6MHD9m34NIFYB6Vt6kEr/+YwR+dr0A211mW/4Xr0oLITu
 R3rDa1q3gpYX/+9ar4OrbLD90sZevvkzi8YBJRc+3iUZV6Wm2JoxCs8L12sbisE+L+DKwYj44
 36QC43ODSSC1HFUVsVOJK+ssCa0wpW5f/tiF/Cey/ZoD1iK4VS0TkdFCwaBwpo6P71wRaXlyV
 XAdgtAxISeN+zhkdHfrUyn9kXdgaG+lpToiKfV+uMRDxzVlXZASUfvbvRh7LsFWEWWOdVWARp
 p2zGYNQZrWlhj6enGdl2YK7IjTrI/wMs7AmTuhvO8KviMqQ75tboszko1OBW0Hc8l7C7kVaC9
 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

The initialization of the AS6200 has two shortcomings

- The device-add-commit states "Conversion mode: continuous" but the
  the lm75_params structure uses set_mask =3D 0x94c0. This activates
  single shot (bit 15) that effectly disables the sensor
- It is the only device that activates polarity active-high (bit 10)

All this is paired with a undefined clear mask bug in function
lm75_write_config() that was introduced with a later refactoring
commit.

[as6200] =3D {
	.config_reg_16bits =3D true,
	.set_mask =3D 0x94C0,
        -> .clr_mask not defined here
	.default_resolution =3D 12,
...
static inline int lm75_write_config(struct lm75_data *data, u16 set_mask,
				    u16 clr_mask)
{
	return regmap_update_bits(data->regmap, LM75_REG_CONF,
				  clr_mask | LM75_SHUTDOWN, set_mask);
}

regmap_update_bits() requires clr_mask to be a superset of set_mask.
So basically AS6200 and TMP112 sensors are not initialized as intended
and AS6200 is effectively driven in polarity active-low.

Fix that by

- changing the set_mask to 0x10c0 to reflect the current active-low
  setup properly and to drive the sensor in continous mode
- adapting the alarm handling so it can report the alarm correctly
  even if it is high active. This is done by xoring config register
  bit 5 and 10 (translated to 2 and 13).

This commit does not introduce any ABI breakage as the mutliple bugs
effectly drive the AS6200 and TMP112 useless.

Fixes 4b6358e ("hwmon: (lm75) Add AMS AS6200 temperature sensor")
Suggested-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
=2D--
 drivers/hwmon/lm75.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/lm75.c b/drivers/hwmon/lm75.c
index f1a1e5b888f6..4fd4288ae502 100644
=2D-- a/drivers/hwmon/lm75.c
+++ b/drivers/hwmon/lm75.c
@@ -137,7 +137,7 @@ static const struct lm75_params device_params[] =3D {
 	},
 	[as6200] =3D {
 		.config_reg_16bits =3D true,
-		.set_mask =3D 0x94C0,	/* 8 sample/s, 4 CF, positive polarity */
+		.set_mask =3D 0x10C0,	/* 8 sample/s, 4 CF */
 		.default_resolution =3D 12,
 		.default_sample_time =3D 125,
 		.num_sample_times =3D 4,
@@ -416,7 +416,7 @@ static int lm75_read(struct device *dev, enum hwmon_se=
nsor_types type,
 			switch (data->kind) {
 			case as6200:
 			case tmp112:
-				*val =3D (regval >> 13) & 0x1;
+				*val =3D !!(regval & BIT(13)) ^ !!(regval & BIT(2));
 				break;
 			default:
 				return -EINVAL;
=2D-=20
2.54.0

