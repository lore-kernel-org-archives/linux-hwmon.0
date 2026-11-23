Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467372;
	b=SUhNKyNsI2X07nX1Dq1AfYRbMEUwyxtPiCfGRhpgGG/mqfSp788YbERFzySq+FdA9rQQ
	 9rsqVcQ5MJJUXDQ21WuPU5Qje544AJ7vWp2UQQeYNhVzBsviMLK240Fgs3pkoy7yJjvJo
	 GwkRebKbV4I2Dks2tZ/obzppIEtNXwgq+PxYSDleVFOg9Igz9xvvx13AvrKorsCplAus/
	 secM9w+wgdnzTgnfCdjcuIlTesliPJ64e6Cdgb8Nyf6f9cC0jMLXVTGSV8nrk7TQkxJ7A
	 Ut8m1pq5CcV1T3nYEv6DgCQmgIjka0IUom9fQhnVnf7jfTV9g6JP7ede1yLDPiBWpSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467372;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3ANpXuafqWPVNd1lkBtx/9v0m52ODj2E62JHw1PMrXc=;
	b=hMOg/dLI/ah13W5VZX5nLycSjQnj4OE2j+KwEQiUVyQcm2UITsy6u1S5G03T6Ylsp+hR
	 T2P4bDDYNVBDOG+XIZUlTj9MFhav7EiWACrVu5VMv0WKx6c3zoIIR1xLIODsUYnjtzVLh
	 XVVMecyz6LtMPGz0WK/sf41aDp2eKSei7ANUpisYYoBq8MZmT0epTtlyttvu+8tJqfefA
	 hi8X3aHkjwsAIsS6c4Og1ksU8EwAMTY7xTHfumG+yUi4IKoXHp0WL26Fzye0xOA9lVvFc
	 gUWmDfSA8KLMg8lSt0vmklO7Kn1IJjgMXrRMpT4u1ImTfZyzPL4eNNNVfLujTQpAz9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YGlpvE31;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JKYlQclY;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D598E606A332
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:56:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D598E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YGlpvE31;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JKYlQclY
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuYBC1579747
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ANpXuafqWPVNd1lkBtx/9v0m52ODj2E62JHw1PMrXc=; b=YGlpvE3185+zcNRC
	Ke6y79Wm6NsMW7wrJaITFCutoGy0RJTFyhQrSd3f/2P5YJLxm4aWKl5/u+q+Qx+v
	pUHFraYXZFCvEenCOgBvUsiH+fGFlBg9Xl2YzVhGOHr7DuHoOfYuTSt4/KlL3qzC
	1vmlAHOdP4TSU4zPU2SyUILNxISbbbYrHOQ2wla1ehB4I+X96fAc1lJPE20vcSbS
	kYU7r+y69Cuxtt70ZuNo25rIm7jnVjK9VwMDQq88ic5epIueLXk3Ak8CrSZdczwV
	l0fHUmOJC9Fh0iBgQ2deWU1IuMKOgJnjoFJ3L18DiryGGcMrnpPYrWQiDynPS4H9
	1BmFeQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ma0tbsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:56:11 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3854627c1c8so5565995eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 12:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467370; x=1796072170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ANpXuafqWPVNd1lkBtx/9v0m52ODj2E62JHw1PMrXc=;
        b=JKYlQclYuzvlvYssp9dqZgpBlRc23gqEK/pkCbb/vCXIKAW/2boZ4q5ZwK+64/ND5z
         hbv1PH3UGz9/BuvwBM8Z/BrQzL/BLDutgdgukmmWfbn/m06BFsrLXTu0ePDEShpUx5MH
         acPPgUiE/7MT8wr3/QTv+SnJgIGA8PE6m6joLKorRoUinpdUji5RhF4SbxnF63Hecvf9
         ooPzhOE5aiks7cC4EcZLGdcVbxqC7K9M5udOGoW/0S9Zo2+ObEhMVzIWRsr4damQMmn7
         zlZXQLXWLXlsvmvkZPooD+l+zmT7j4kq88WwI2fbyBg8n9azZ/qnla+R20NN1wqS+h2U
         fJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467370; x=1796072170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ANpXuafqWPVNd1lkBtx/9v0m52ODj2E62JHw1PMrXc=;
        b=frITcLBN76yfazM011Wa6D5CA8OjA8pmMWMfr0wyyfwjsJyP+OIO+PZYdfzkQuXfmH
         F+wO6qeQP6mEgvYjMVw7i8WjV7DRnvr+AdFr73GpLXMrhWl+i9Fkg49CgrOoqo2XIl1A
         doLDCO6iDIq+zzu2m6yFm7encUa4utjn7fDei6D5WNxiHR+bR7PtgXqKCjraTyZI9TMB
         sZn1+O0By/QtcGvGnGc1xsIlTzdNohHTBlTJYVw77WwkAvNMG0Jcy55bHBoo7mQiUBRV
         I2f3bT9kYvT1nkWpX/0p0B8ThehZPAX2lxuxbJpe9g5MlR76S3gjiKwV7amY4e9GptLY
         2EpQ==
X-Gm-Message-State: APuU4Z+c9RbDz4T6dbs+U2RxNLp+LhGMyFXEVDhAgkmRHGeHpryAtNBx
	mZY2DLWVQFURLRCbGMEqmkEnQ5svAzjdos9EHK9HdoD3yl/KMRdKqto7P8iFsTRr6Dx9UbTYbMG
	GjITgX7twNmPiHbUktYzx3GLNCSCsv3zPHDq9242VCZSgYEdL6zixzXxGiVsYt/A/iA==
X-Gm-Gg: AZFdTZccsZRokORHyJKYHvBHhxe0CBf2/9pViWZpQ5tyJpuoQmGeE9KyHeSx5vGkJiD
	pKEpt4M8LMbhMUcO8xaJJNSanGrnzsu65aUmHV3IwpGmzfKS3MGW7dIHy1qDd1NZ/eB9VgCr12h
	uGAL6mAvPhfth4wwqDKINpmWNPjiJboyOx1Qo/J+EOptFU5c8ZPY7CqIxXS1lQ+YaDT7PvhqS/p
	3Pf/M9EzEITvcJ/KVxJqqW83Ot+Vr3h/8EJTsubCdKP0eFWe1kE+gI0qTk3jbnXoLDokMIv0kmi
	75H/Bz0rb2S+AYfnzg+H2yJAOj4E0jT+d339UzhZtMirR4oCft0lhA24wmYkE0JUIGS2tUwFwCj
	SYp4z4352cCkahA3Btn52O5V220CdM4rJtWg6Ozs0QJ7QsgeSMuKjU+oAxYwNOjsysM3/q6V0Yu
	B3nNBJ8x1r
X-Received: by 2002:a05:7300:1909:b0:383:f646:9feb with SMTP id 5a478bee46e88-3856c4b8304mr19946901eec.2.1795467370517;
        Mon, 23 Nov 2026 12:56:10 -0800 (PST)
X-Received: by 2002:a05:7300:1909:b0:383:f646:9feb with SMTP id 5a478bee46e88-3856c4b8304mr19946867eec.2.1795467369912;
        Mon, 23 Nov 2026 12:56:09 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:56:09 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:50 +0530
Subject: [PATCH v5 10/12] arm64: dts: qcom: pmih0108-kaanapali: Enable BCL
 sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-10-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1326;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=vQA8tXnjMgCPq3216Osyn7C4Zn7d/iM3eHvItTtMIyQ=;
 b=7o1OGucmXYOKDo2bVa0gCDnP/K9W9ENk6/wgM8rCg5bs4t98Mb2pKpchVkjKTEeowv0fgDD6U
 tX3jHhP85+KAH932WIpkebZ5iOE3RIZeitr08mZfWSp0Qe5nSe0i/vd
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: SxoGuyV4_lSTV7MfAvS12iJMHX--2xEj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX13Q5ij4gY9fh
 3t9b11hxH0F00gOD5a1rBY7DJLSmNrmUeArxZ20EfDO1X7zCyUVE1Q/QylX1lXCS3YE9dGrMjg5
 A4k3/0i1fKZ4ZJrm0WiCKThnW4MbBMM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXxu/OYIfCJGeF
 E7ow3gm5kqyphRE1IR1FHbg3XuUAVRM0Y32g+S9hAKFsVvOlHygH4RdotSbfhCi+gTBgsmup4Ev
 hb+dRjTFOiWvwwjt7PKC2GUFnZVdqGmkOA6fpSTWrVfPySqprolvhsimoq3pvP2eHI2LblQ8WJe
 CP/gpJdlbSsXyOX3IDvCLhIxlCQy+Kn/Y2cREQLCdcG+y2A7Gv/jclnX95vwxK4dt+Y3f5cT/dU
 He+oV7lEFn04v7vM3vPRP9MhTMpDFqIhUL+82BOo6KuJCNOrW8EzJkrr71fcc7uBd6bxp5NSukr
 zXhXOK9dezTMlk7eyxVOwsTqairmoYsPE3g9aWp2lfo+Mc9qn7q7IwENJTuZ9kRm7cc/5ixXdgQ
 pReh0qQyvjwHliicgjFZku8eaWcs4V8xS/hRV973u7OQHxoQyvfxRhuUcOYp5XFrYYVt/t04Dqz
 xqyDODLNNgUmcfqEOWQ==
X-Authority-Analysis: v=2.4 cv=Yr+a1IYX c=1 sm=1 tr=0 ts=6b04a86b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: SxoGuyV4_lSTV7MfAvS12iJMHX--2xEj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 clxscore=1015 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
index b73b0e82c3d3..9f6bef6087cf 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108-kaanapali.dtsi
@@ -49,6 +49,17 @@ pmih0108_e1_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmih0108_e1_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

