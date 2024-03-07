package com.maximesimet.capacitor.cpumonitoring;
import static java.sql.DriverManager.println;

import android.os.Process;
import android.os.SystemClock;
public class CPUMonitoring {

    public String getInfo() {
        var previousIdleTime: Long = 0;
        var previousTotalTime: Long = 0;

        while (true) {
            val cpuReader = BufferedReader(FileReader("/proc/stat"));
            val cpuLine = cpuReader.readLine();
            cpuReader.close();

            val cpuStats = cpuLine.split(" ");

            var idleTime = cpuStats[5].toLong();
            var totalTime = cpuStats.fold(0L) { acc, it -> acc + it.toLongOrNull() };

            var totalTicksDelta = totalTime - previousTotalTime;
            var idleTicksDelta = idleTime - previousIdleTime;
            var usage = (totalTicksDelta - idleTicksDelta).toDouble() / totalTicksDelta * 100.0;

            println("CPU Load: %.2f%%".format(usage));

            previousIdleTime = idleTime;
            previousTotalTime = totalTime;

            Thread.sleep(1000);
        }
    }
}
