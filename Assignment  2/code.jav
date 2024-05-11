import java.util.*;

class Node implements Comparable<Node> {
    Character symbol;
    int frequency;
    Node left;
    Node right;

    public Node(Character symbol, int frequency) {
        this.symbol = symbol;
        this.frequency = frequency;
        this.left = null;
        this.right = null;
    }

    @Override
    public int compareTo(Node other) {
        return this.frequency - other.frequency;
    }
}

/**
 * The HuffmanTree class represents a binary tree used for Huffman coding.
 * It provides methods for building a Huffman tree, generating Huffman codes,
 * compressing and uncompressing sequences using the Huffman codes.
 */
public class HuffmanTree {
    public static Node buildHuffmanTree(List<Character> symbols) {
        Map<Character, Integer> frequencyMap = new HashMap<>();
        for (char symbol : symbols) {
            frequencyMap.put(symbol, frequencyMap.getOrDefault(symbol, 0) + 1);
        }

        PriorityQueue<Node> priorityQueue = new PriorityQueue<>();
        for (Map.Entry<Character, Integer> entry : frequencyMap.entrySet()) {
            Node node = new Node(entry.getKey(), entry.getValue());
            priorityQueue.add(node);
        }

        while (priorityQueue.size() > 1) {
            Node leftChild = priorityQueue.poll();
            Node rightChild = priorityQueue.poll();
            int parentFrequency = leftChild.frequency + rightChild.frequency;
            Node parent = new Node(null, parentFrequency);
            parent.left = leftChild;
            parent.right = rightChild;
            priorityQueue.add(parent);
        }

        return priorityQueue.poll();
    }

    public static void generateHuffmanCodes(Node node, String currentCode, Map<Character, String> huffmanCodes) {
        if (node.symbol != null) {
            huffmanCodes.put(node.symbol, currentCode);
            return;
        }

        generateHuffmanCodes(node.left, currentCode + "0", huffmanCodes);
        generateHuffmanCodes(node.right, currentCode + "1", huffmanCodes);
    }

    public static String compressSequence(List<Character> sequence, Map<Character, String> huffmanCodes) {
        StringBuilder compressedSequence = new StringBuilder();
        for (char symbol : sequence) {
            compressedSequence.append(huffmanCodes.get(symbol));
        }
        return compressedSequence.toString();
    }

    public static String uncompressSequence(String compressedSequence, Node huffmanTree) {
        StringBuilder uncompressedSequence = new StringBuilder();
        Node current = huffmanTree;
        for (char bit : compressedSequence.toCharArray()) {
            if (bit == '0') {
                current = current.left;
            } else {
                current = current.right;
            }

            if (current.symbol != null) {
                uncompressedSequence.append(current.symbol);
                current = huffmanTree;
            }
        }
        return uncompressedSequence.toString();
    }

    public static void main(String[] args) {
        List<Character> sequence = Arrays.asList('t', 'h', 'i', 's', 'i', 's', 'a', 'n', 'e', 'x', 'a', 'm', 'p', 'l', 'e', 'o', 'f', 'a', 'h', 'u', 'f', 'f', 'm', 'a', 'n', 't', 'r', 'e', 'e');
        Node huffmanTree = buildHuffmanTree(sequence);
        Map<Character, String> huffmanCodes = new HashMap<>();
        generateHuffmanCodes(huffmanTree, "", huffmanCodes);
        String compressedSequence = compressSequence(sequence, huffmanCodes);
        String uncompressedSequence = uncompressSequence(compressedSequence, huffmanTree);

        System.out.println("Original sequence: " + sequence);
        System.out.println("Compressed sequence: " + compressedSequence);
        System.out.println("Uncompressed sequence: " + uncompressedSequence);
    }
}