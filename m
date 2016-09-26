Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:42178 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1758253AbcIZItR (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Sep 2016 04:49:17 -0400
Received: from relay1.suse.de (charybdis-ext.suse.de [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id A3510AC9E
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Sep 2016 08:49:15 +0000 (UTC)
Date: Mon, 26 Sep 2016 10:49:14 +0200
From: Jean Delvare <jdelvare@suse.de>
To: linux-hwmon@vger.kernel.org
Subject: [PATCH] sensors-detect: Report proper processor information on ppc
Message-ID: <20160926104914.554fb354@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

The format of /proc/cpuinfo on ppc differs from the x86 format. Add
the missing pieces to the parsing code so that ppc processor
information is reported properly.
---
 prog/detect/sensors-detect |    8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

--- a/prog/detect/sensors-detect
+++ b/prog/detect/sensors-detect
@@ -2864,7 +2864,7 @@ sub initialize_cpu_list
 			};
 			next;
 		}
-		if (m/^(vendor_id|cpu family|model|model name|stepping|cpuid level)\s*:\s*(.+)$/) {
+		if (m/^(vendor_id|cpu family|model|model name|stepping|cpuid level|cpu|revision)\s*:\s*(.+)$/) {
 			my $k = $1;
 			my $v = $2;
 			$v =~ s/\s+/ /g;	# Merge multiple spaces
@@ -2880,7 +2880,11 @@ sub initialize_cpu_list
 sub print_cpu_info
 {
 	my $cpu = $cpu[0];
-	print "# Processor: $cpu->{'model name'} ($cpu->{'cpu family'}/$cpu->{model}/$cpu->{stepping})\n";
+	if (defined  $cpu->{'model name'}) {
+		print "# Processor: $cpu->{'model name'} ($cpu->{'cpu family'}/$cpu->{model}/$cpu->{stepping})\n";
+	} elsif (defined $cpu->{'cpu'}) {	# ppc
+		print "# Processor: $cpu->{'cpu'}, revision $cpu->{'revision'}\n";
+	}
 }
 
 # @i2c_adapters is a list of references to hashes, one hash per I2C/SMBus


-- 
Jean Delvare
SUSE L3 Support
